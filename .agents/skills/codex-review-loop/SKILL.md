---
name: codex-review-loop
description: "Run Codex CLI review in a read-only sandbox, verify which findings genuinely require action, delegate only verified fixes to a neighboring Codex pane through herdr, monitor questions and completion, validate the result, and repeat until no actionable findings remain. Use when the user asks for a Codex review-to-fix loop or wants review findings investigated before another Codex implements them."
---

# Codex Review Loop

## 目的

`codex review` の結果を鵜呑みにせず、親 Codex が各指摘を調査して対応要否を判断する。対応が必要な指摘だけを Herdr の隣ペインにいる Codex へ依頼し、完了後に差分と検証結果を確認して再レビューする。

ループの終了条件は、レビュー出力を機械的にゼロにすることではなく、**事実確認できた対応必須・対応推奨の指摘が残っていないこと**とする。

## 必須原則

- `codex review` の出力は調査の起点であり、修正指示そのものではない。
- すべてのレビューは `codex --sandbox read-only review` で実行し、レビュー用 Codex にファイルを書き込ませない。
- 指摘ごとに対象コード、呼び出し元、関連テスト、仕様・ドキュメント、現在の差分との因果関係を確認する。
- 対応要否の調査が完了するまで、隣の Codex へ依頼しない。
- 誤検知、既に防御済みの問題、主観的な提案、現在の差分と無関係な問題は依頼しない。
- 判断材料が不足する場合は推測で進めず、追加調査後も不明ならユーザーへ質問する。
- ユーザーが明示しない限り、コミット、push、PR 作成を行わない。
- 既存変更や並行して発生した変更を勝手に戻さない。
- 作業対象外のリファクタリングを隣の Codex に依頼しない。
- リポジトリ内の `AGENTS.md` と適用対象のスキルを優先して守る。

## 前提確認

最初に `herdr` スキルを読み、次を確認する。

```bash
test "${HERDR_ENV:-}" = "1"
test -n "${HERDR_PANE_ID:-}"
test -n "${HERDR_TAB_ID:-}"
command -v codex
command -v herdr
command -v jq
git rev-parse --show-toplevel
```

`HERDR_ENV=1` でなければ、Herdr 管理下の隣ペインを操作できないため停止して報告する。Python で JSON を解析せず、`jq` を使用する。

開始時に以下を記録する。

```bash
git status -sb
git diff --stat
git diff --cached --stat
```

この記録を、隣の Codex が作業対象外を変更していないか確認する基準にする。

## 1. レビュー対象を決定する

### 未コミット差分がある場合

staged、unstaged、untracked のいずれかがあれば、すべてを対象にする。

```bash
git status --porcelain=v1
codex --sandbox read-only review --uncommitted "バグ、回帰、セキュリティ、データ不整合、仕様逸脱、明確な保守性または性能上の問題に限定してレビューしてください。主観的なスタイル提案や根拠のない推測は指摘しないでください。各指摘にはファイルと行、成立条件、実害を含め、対応すべき問題がなければその旨を明記してください。"
```

### 未コミット差分がない場合

現在のブランチに対応する PR があれば、PR の base branch を使用する。

```bash
gh pr view --json baseRefName --jq '.baseRefName'
codex --sandbox read-only review --base <base-branch> "バグ、回帰、セキュリティ、データ不整合、仕様逸脱、明確な保守性または性能上の問題に限定してレビューしてください。主観的なスタイル提案や根拠のない推測は指摘しないでください。各指摘にはファイルと行、成立条件、実害を含め、対応すべき問題がなければその旨を明記してください。"
```

PR が存在せず base branch を事実確認できない場合は、`main` などを推測せずユーザーへ質問する。

レビューコマンドが失敗した場合は原因を確認して一度だけ再試行する。再度失敗したらループを停止して報告する。

## 2. 指摘を調査して対応要否を判定する

各指摘について、次の順番で確認する。

1. 指摘された行と周辺の実装を読む。
2. 入力元、呼び出し元、戻り値の利用先まで追跡する。
3. 関連する型、DB 制約、認可、例外処理、既存テストを確認する。
4. 仕様書、Issue、ADR、コメントなどに期待動作があれば照合する。
5. 問題が成立する具体的な入力・状態・並行実行条件を説明できるか確認する。
6. 現在の差分が問題を新規に発生させたか、既存問題を悪化させたか確認する。
7. 必要に応じて対象テストや最小の再現手順を実行する。

調査結果を次の区分で整理する。

| 判定 | 基準 | 次の操作 |
|---|---|---|
| 対応必須 | バグ、回帰、セキュリティ、データ破損、仕様逸脱を事実確認できた | 隣の Codex へ依頼 |
| 対応推奨 | 明確な保守性・性能リスクがあり、今回の差分内で安全に修正できる | 隣の Codex へ依頼 |
| 対応不要 | 誤検知、防御済み、主観的提案、対象外、修正リスクが上回る | 理由を記録し依頼しない |
| 判断不能 | 追加調査後も仕様または成立条件を確定できない | ユーザーへ質問 |

最低限、指摘ごとに次を記録する。

```text
- 指摘:
- 確認した事実:
- 成立条件と影響:
- 判定: 対応必須 / 対応推奨 / 対応不要 / 判断不能
- 判定理由:
- 修正対象と触らない範囲:
```

対応必須・対応推奨が 0 件なら、隣ペインを作成せず、調査結果と残存リスクを報告して終了する。

## 3. 隣の Codex ペインを準備する

対象がある場合だけ、現在のペインを右に分割して専用 Codex を起動する。同じループ中は作成したペインを再利用し、既存の別 Codex ペインを勝手に使用しない。

```bash
REPO_ROOT=$(git rev-parse --show-toplevel)
WORKER_PANE=$(herdr pane split "$HERDR_PANE_ID" --direction right --no-focus | jq -r '.result.pane.pane_id')
herdr pane run "$WORKER_PANE" "codex -C \"$REPO_ROOT\" --no-alt-screen"
herdr wait agent-status "$WORKER_PANE" --status idle --timeout 30000
```

ペイン ID は分割結果から取得し、推測しない。以降のループでも `WORKER_PANE` を使う。

## 4. 調査済みの指摘だけを依頼する

元のレビュー文をそのまま転送しない。親 Codex が確認した根拠と境界を含む依頼を作る。

```text
次のレビュー指摘は、親エージェントが対象コードと関連仕様を調査し、対応が必要と判断したものです。

## 対応対象
<指摘ごとに、確認した事実、成立条件、影響、対象ファイル、期待動作を記載>

## 修正条件
- 上記以外の変更やリファクタリングを行わない。
- 既存の未コミット変更を戻さない。
- コミット、push、PR 作成を行わない。
- リポジトリの AGENTS.md と関連スキルに従う。
- 修正後に関連テスト、型検査、lint の必要な範囲を実行する。

## 応答
- 判断に必要な情報が不足する場合は、作業を止めて最終応答を `REVIEW_LOOP_QUESTION:` から始める。
- 完了時は、変更内容、検証結果、残存懸念を記載し、最終応答を `REVIEW_LOOP_DONE:` から始める。
```

依頼は `herdr pane run "$WORKER_PANE" "$PROMPT"` で送る。

## 5. 質問と完了を監視する

```bash
herdr wait output "$WORKER_PANE" --match 'REVIEW_LOOP_(QUESTION|DONE):' --regex --timeout 1800000
herdr pane read "$WORKER_PANE" --source recent-unwrapped --lines 160
```

### 質問を受けた場合

- コード、仕様、ドキュメントから事実確認できる質問は親 Codex が回答する。
- 製品判断、仕様変更、複数の妥当な選択肢がある質問はユーザーへ確認する。
- 回答後、同じペインへ作業継続を依頼し、再度待機する。
- タイムアウト時は `herdr pane list` と `pane read` で状態を確認し、無反応のまま再依頼を連打しない。

## 6. 親 Codex が修正を検証する

隣の Codex の完了報告だけで成功扱いにしない。

1. `git status -sb` と `git diff` で変更範囲を確認する。
2. 対応対象外の変更があれば、勝手に戻さずユーザーへ確認する。
3. 指摘された成立条件が解消されたことをコード上で確認する。
4. 追加・変更されたテストが問題の再現条件を検証しているか確認する。
5. リポジトリの指示に従い、対象テスト、型検査、lint を実行する。
6. 検証失敗時は原因を調査し、必要な修正だけを同じペインへ再依頼する。

## 7. 再レビューする

最初に決定した対象方式で `codex --sandbox read-only review` を再実行し、新しい指摘にも「調査して対応要否を判定する」工程を最初から適用する。

以下のいずれかまで反復する。

- 事実確認できた対応必須・対応推奨の指摘が 0 件になった。
- 同じ実質的な指摘が 2 回連続し、追加修正では前進しない。
- 5 回のレビュー・修正サイクルに達した。
- 想定外の変更、仕様判断、外部要因により安全に継続できない。

同一指摘の判定では、文言ではなく「ファイル、原因、成立条件、実害」を比較する。

## 完了報告

次を簡潔に報告する。

- 実行したレビュー回数
- 各指摘の対応要否と、その根拠
- 隣の Codex に依頼した修正内容
- 親 Codex が確認した差分と検証結果
- 対応不要とした指摘、その理由
- 未解決事項または残存リスク
- コミット、push、PR 作成を行っていないこと
