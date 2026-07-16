---
name: codex-review-loop
description: >-
  Codex レビュー → 対応判断（必要ならユーザー確認）→ 隣の Codex ペインへ実装依頼
  → 自分の環境で検証 → 再レビュー、を「レビューが pass するまで」繰り返す反復
  ハードニングのループを回す。

  次のような依頼・状況で使う:
  - 「Codex にレビューして、指摘を対応して、また Codex にレビュー、をパスするまで繰り返して」
  - 「codex:review のループを回して」「レビュー指摘がなくなるまで直して」
  - 変更を隣のペインの Codex に実装させ、自分は設計・判断・検証・コミットに徹したいとき
  - ブランチをマージ前に、Codex レビューで指摘ゼロまで仕上げたいとき

  対象は原則コミット済みブランチ差分（main...HEAD）。実装は隣の Codex ペインへ委譲し、
  自分は「指摘の妥当性判断・ユーザー確認・検証・コミット」を担う。
---

# Codex レビュー・ループ

Codex レビューの指摘を「隣の Codex ペインに実装させ、自分で検証し、再レビュー」で
潰し切るループ。**自分（Claude）は実装せず、判断・検証・コミット・ユーザー確認に徹する。**

## 前提・役割分担
- **レビュー実行役 = 自分（Claude）**: `codex:review` を回し、指摘の妥当性を判断し、検証し、コミットする。
- **実装役 = 隣の Codex ペイン**（herdr の agent:codex・同じ cwd／ブランチを共有するペイン）。
  実装依頼はこのペインに投げる（[[codex-implementation-delegation]] の方針）。
- `codex:review` は **コミット済みの `main...HEAD`** を対象にする（作業ツリーの未コミット
  変更はレビュー対象外）。**必ずコミットしてからレビューする。**

## ループ（1周）

### 0. 準備
- 対象変更がフィーチャーブランチにコミット済みか確認（`git log --oneline main..HEAD`・`git status --short`）。
- 隣の Codex ペイン ID を把握（`herdr pane list` で agent:codex・同 cwd のもの。例では `w4:pD`）。

### 1. codex:review を実行（バックグラウンド）
```bash
node "<codex-companion.mjs のパス>" review "" # 例: ~/.claude/plugins/cache/openai-codex/codex/<ver>/scripts/codex-companion.mjs
```
- `Bash(run_in_background: true)` で投げ、完了通知を待つ。出力ファイルの末尾に `# Codex Review` 以降の指摘が入る。
- 大きめの差分（複数ファイル）はバックグラウンド推奨。

### 2. 指摘を読み、分類する
- 出力の `# Codex Review` 以降を読む。指摘は `[P1]=要修正 / [P2]=推奨 / [P3]=軽微`。
- **指摘なし（P1/P2 が無い）→ pass。ループ終了。**

### 3. 各指摘の妥当性を自分で判断する（鵜呑みにしない）
- 指摘の**前提をコードで検証**する（例「この列は未索引」→ schema を grep して確認、「未認証で公開」→ ルートを Read）。誤検知・的外れなら理由を添えてスキップ。
- **循環・振り戻し指摘に注意**: 一度ユーザーが決めたトレードオフ（例: R2 削除を tx 内/外どちらに置くか）を蒸し返す指摘は、再実装で往復しない。「既に判断済みのトレードオフ」として要点だけ再提示する。
- スケール系（索引・バッチ）の指摘は、MVP 規模での実害と実装コストを天秤にかける。

### 4. 必要ならユーザーに確認（そうでなければ進める）
次のいずれかは `AskUserQuestion` で確認する（推奨案を先頭に・理由付きで）:
- 追加スコープになる（別機能を足す）指摘
- 過去の判断を覆す／往復する指摘
- 書き込みコストや設計に実質的トレードオフがある指摘（索引の増設可否など）
- 「どこまで対応するか」の範囲判断
上記に当たらない明確な修正（誤りの訂正・軽微な整理）は確認不要で進めてよい。

### 5. 隣の Codex ペインに実装依頼
- **依頼内容は spec ファイルに書く**（$CLAUDE_JOB_DIR/tmp など）。TUI に長文を貼らない。
- spec には必ず含める: 対象ブランチ、**git commit 禁止・余計なことをしない**、日本語コメント、
  catch を握りつぶさない、既存挙動を変えない旨、具体的な変更点、**検証コマンド（test/typecheck 等）**、報告項目。
- ペインへ送る手順（gotcha に注意）:
  ```bash
  herdr pane send-keys <pane> "ctrl+c"          # 入力クリア（必要なら2回）
  herdr pane send-text <pane> "<spec のパス> を読んで実装して。spec 以外はしない。完了したら <テスト> を実行し報告。git commit しない。"
  herdr pane send-keys <pane> "enter"           # 送信確定
  ```
- **完了待ち**: `herdr pane read <pane>` を until ループで監視し、ステータスが `Working`→`Ready`
  に安定するまで待つ（run_in_background の Bash + `while ... grep -q "Working"; do sleep 15; done`）。
  古い `Worked for` マーカーを拾って早発火しないよう、`Working` の消失で判定する。
- **質問対応（重要・`Working` の消失＝完了とは限らない）**: Codex は作業中に**承認/質問プロンプトで一時停止**
  することがある。監視ループが発火したら必ず画面を読み、「**質問か完了か**」を判別する。
  - **質問なら即回答してから作業継続**（放置すると止まったまま進まない）。回答方法（TUI）:
    選択肢は数字/矢印で選び、既定は `Recommended`。注記を付けるなら
    `send-keys <pane> "tab"` → `send-text <pane> "<注記>"` → `send-keys <pane> "enter"`。
    注記不要なら `send-keys <pane> "enter"` で既定選択を送信。
  - Codex の指摘が誤っていれば（例: 誤った API 非推奨情報）**注記で訂正を添えてから**正しい選択肢を選ぶ。
  - Codex は「認知していない変更」（自分が作っていない未追跡ファイル等）を検知して確認してくることがある
    → 意図的なら「意図的な変更（触れず続行）」を選び、理由を注記する。
  - **完了なら**（`─ Worked for ... ─` の区切り＋最終報告が出て `Ready`）ステップ6の検証へ。

### 6. 自分の環境で検証（Codex の報告を鵜呑みにしない）
- プロジェクトのテスト・型チェック・（あれば）ビルドを自分で回す。件数が減っていないか確認。
- **認知していない変更が無いか** `git status` / `git diff` を確認（[[no-silent-catch]] や意図外変更の検出）。
  マイグレーションを触る変更では「既存マイグレーション不変・生成物が想定どおり」を必ず確認。
- 破綻していれば Codex に差し戻す（spec を追記して再依頼）。

### 7. コミット（ユーザー指示があれば）
- 次のレビューが変更を見えるようにするため、検証後にコミットする（`codex:review` はコミット済みが対象）。
- コミットは[[commit-message]]方針（絵文字付き Conventional Commit・日本語・AI 署名なし）。
- **push・PR/MR はユーザーの明示指示があるまでしない。**

### 8. 再レビュー
- 1 に戻る。**指摘が pass（P1/P2 の要対応なし）になるまで繰り返す。**

## 終了条件
- `codex:review` が要対応の指摘（P1/P2）を返さなくなったら終了。
- 残りが「ユーザーが受容済みのトレードオフ」や「見送り合意済みの P2/P3」だけなら、それも pass 扱い。
  収束（P1→P2→軽微 と指摘が段々マージナルになる）を見極め、際限ない微最適化に付き合わない。

## 運用 gotcha（重要）
- `codex:review` は Skill ツールから起動できない設定のことがある → コンパニオンスクリプトを直接 `node ... review ""` で実行。
- herdr は `send-text`（本文入力）と `send-keys`（キー: `enter`/`ctrl+c` 等）が別。`send` は無い。
- Codex TUI へのプロンプトを **`/` で始めない**（スラッシュコマンド誤認）。
- `ctrl+c` 2 回で Codex TUI 自体が終了することがある。終了したら `codex resume <session-id>` で再開。
- ペイン context が高くなってきたら（例 80%+）大きな依頼は分割するか、resume で仕切り直す。
- 実装依頼は 1 依頼 1 目的に絞る（spec で「これ以外やらない」と明示）。

## このプロジェクト（ghosgent）での具体コマンド例
```bash
# レビュー
node "/Users/piory/.claude/plugins/cache/openai-codex/codex/1.0.6/scripts/codex-companion.mjs" review ""
# 検証（apps/api）
pnpm test           # vitest（workers pool）
pnpm test:db        # DB 統合（要 docker compose の PostgreSQL）
pnpm typecheck      # ルートで全ワークスペース
pnpm generate:openapi # 差分が出ないこと（API 変更時）
```
