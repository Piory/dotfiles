---
name: github-pr-review
description: Review GitHub pull requests using GitHub MCP with clear severity levels and actionable feedback.
---

# GitHub PR レビュー (GitHub MCP)

## 目的
GitHub MCP を使って Pull Request をレビューし、対応優先度が分かる形で指摘を提示する。

## 必須方針
- PR の取得と確認は GitHub MCP を使う。
- 指摘は事実ベースで書き、推測は推測と明記する。
- 重大度を必ず付与する。
- 重大度の高い順に提示する。
- 各指摘に「何が問題か」「なぜ問題か」「どう直すか」を含める。
- ユーザー指示があるまで PR の作成は行わない。

## 重大度レベル
- `必須対応`:
  マージ前に修正が必要。バグ、セキュリティ、データ破損、仕様逸脱、重大な回帰。
- `推奨対応`:
  できれば今回で修正。可読性、保守性、軽微な性能問題、将来不具合のリスク。
- `任意対応`:
  改善提案。今すぐでなくてもよい最適化や記述改善。

## 手順
1) 対象 PR を特定する
   - リポジトリ、PR 番号、レビュー観点（バグ中心/設計中心など）を確認する。
2) PR 情報を取得する
   - GitHub MCP で以下を取得する。
   - `pull_request_read(method=get)`
   - `pull_request_read(method=get_files)`
   - 必要に応じて `pull_request_read(method=get_diff)`
   - 必要に応じて `pull_request_read(method=get_review_comments)` と `pull_request_read(method=get_comments)`
3) 変更内容を評価する
   - バグ、回帰、境界条件、例外処理、セキュリティ、テスト不足を優先して確認する。
4) 指摘を重大度付きで整理する
   - 重大度順で並べる（必須対応 → 推奨対応 → 任意対応）。
5) レビュー結果を読みやすく提示する
   - 下記フォーマットに従う。
6) ユーザー指示がある場合のみ、GitHub MCP でコメント投稿する
   - PR コメント: `add_issue_comment`
   - 行コメント（レビューコメント）: `add_comment_to_pending_review` またはレビューAPIを利用

## 出力フォーマット
以下の形式で提示する。

```md
## レビュー結果

### 必須対応
1. [ファイル:行] 問題の要約
- 何が問題か:
- なぜ問題か:
- 修正案:

### 推奨対応
1. [ファイル:行] 問題の要約
- 何が問題か:
- なぜ問題か:
- 修正案:

### 任意対応
1. [ファイル:行] 改善提案の要約
- 内容:
- 補足:

### 補足
- 未確認項目:
- 前提・仮定:
```

## 指摘がない場合
- 明確に「重大な問題はなし」と記載する。
- 残存リスク（テスト不足や確認範囲外）を短く記載する。

