---
name: github-pr-create
description: Create GitHub pull requests using GitHub MCP. Use when the user asks to open/create a PR, draft a PR, or publish changes to GitHub. Follow the repository’s PR template and match the format of recent PRs.
---

# GitHub PR 作成 (GitHub MCP)

## 目的
GitHub MCP を使って、リポジトリの PR テンプレートと既存 PR のフォーマットに合わせた PR を作成する。

## 必須方針
- GitHub MCP を使って PR を作成する。
- PR テンプレートがある場合は必ず従う。
- 直近の PR を参照してタイトル/本文の形式を合わせる。
- 不明な点はユーザーに確認する。
- 機密情報は含めない。

## 手順
1) 対象リポジトリ・ブランチ・ベースブランチを確認する
   - ユーザーの指定がない場合は質問する。
2) 変更内容を把握する
   - 差分、変更ファイル、主要な変更点を整理する。
3) PR テンプレートを探す
   - `.github/PULL_REQUEST_TEMPLATE*` や `.github/pull_request_template.md` などを GitHub MCP で確認する。
4) 直近の PR フォーマットを把握する
   - 同一リポジトリの直近の PR を数件取得し、タイトル/本文の構成を確認する。
5) PR タイトルと本文を作成する
   - テンプレートと既存 PR の形式に合わせる。
   - 変更内容・影響範囲・確認手順を簡潔に記載する。
6) GitHub MCP で PR を作成する
   - draft かどうか、レビューア、ラベル等は必要に応じてユーザーに確認する。
7) 作成後の確認
   - PR URL を提示し、必要な追加情報（レビュー依頼など）を確認する。

## 迷ったときの確認事項
- ベースブランチはどれか
- draft か通常 PR か
- レビューア/ラベル/マイルストーンの要否
- テンプレートに書く検証コマンド

