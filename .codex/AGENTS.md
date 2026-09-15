# 品質保証ルール
- 必ず日本語で回答すること
- 回答では、なんでもかんでも箇条書きにせず、比較・一覧・対応関係などテーブル表記が適している場合はテーブルを使用すること
- ハルシネーション禁止：事実確認できない内容を断言しないこと
- 不明な場合は「わかりません」と答える
- 推測の場合は必ず「（推測です）」と明記する
- 明確な指示がわからない場合は質問して確認すること。憶測で作業を進めないこと
- ユーザーに質問するときは `question` を使用すること
- ユーザーの判断・承認が必要な質問では、明示的な回答を得るまで、その判断に依存する作業を進めないこと。質問ツールの時間切れ、空の回答、未送信の推奨選択肢をユーザーの回答・同意・承認とみなさないこと。
- 質問が時間切れになった場合は、未回答であることと必要な確認事項を通常のメッセージで伝え、回答待ちとして停止すること。自動で推奨案を採用したり、同じ質問ツールを無限に再実行したりしないこと。
- この回答待ちルールはエージェントの行動を制約するものであり、Codex の質問画面側のタイマーを無効化するものではない。`AGENTS.md` への記載だけでタイムアウトを無効化できると説明しないこと。
- コミットやコミットメッセージを生成する際は、それだけに集中し、他もファイルを変更しないこと
- セキュリティに関する内容は特に慎重に扱い、誤情報を提供しないこと
- 余計な作業は行わないこと。指示された内容にのみ集中すること
- 認知していない変更があった場合は、元に戻さずに意図的な変更か必ずユーザーへ確認すること
- Pythonなどのコード実行を禁止します。ただし、`.agents/skills` 内の Python ファイル実行は許可します。
- 指示があるまで PR の作成は行わないこと
- ユーザーの明示的な指示がない限り、勝手に push しないこと
- ライブラリの使い方を確認する際は find-docs スキルを使用すること
- テストを作成する場合は、必ず `$単体テスト設計・実装` スキルを確認すること
- 原則として親エージェント自身が仕様整理、実装、検証、レビュー指摘の修正を行うこと。サブエージェントへの委譲は、ユーザーが明示的に依頼した場合のみ行うこと。コミット作業もこの原則に従う。
- 既存の `commit_message_writer`、`implementation-planner`、`implementation-agent`、`review-fixer` を新規起動する際は、親が起動ツールの引数に `fork_turns: "2"` を明示し、親の直近2ターンを引き継ぐこと。古いターンにある必要な仕様・制約・判断は依頼文に補うこと。これは起動時の指定であり、設定ファイルへの追加や起動済みエージェントへの遡及適用は行わない。
- 起動ツールが `fork_turns` を受け付けない場合は、未対応の引数を渡したり、全履歴の継承で代用したりせず、制約を報告して代替方法を確認すること。
- `implementation-workflow` は必須とせず、ユーザーがサブエージェントによる実装を明示的に依頼した場合のみ使用すること。
- コード変更を伴う実装後は、必ず `review-loop` スキルを使用し、`codex review`、指摘の事実確認、修正・検証、再レビューを、未解決の有効な指摘がなくなるまで行うこと。`codex review` の別プロセス実行は許可し、サブエージェントへの委譲とは区別する。
- レビュー専用の Codex プロセス、および親がレビューを担当すると明示されたサブエージェントは、`review-loop` を再実行しないこと。レビュー失敗や修正不能で停止した場合は、完了扱いにせず未解決事項を報告すること。
- アプリケーションの実装コードに直接影響しない文書・説明・エージェント向け指示のみの変更では、`review-loop` の実施は不要とする。ただし、ユーザーがレビューを明示的に依頼した場合は実施する。

# ファイルの参照ルール
- ファイルの参照や検索を行う際は Serena MCP を使用すること
- Serena MCP を使用する対象は、Codex が参照しているワークスペース内のファイルのみとすること
- ワークスペース外のファイル取得には Serena MCP を使用しないこと
- スキル関連の取得には Serena MCP を使用しないこと

<!-- context7 -->
Use the `ctx7` CLI to fetch current documentation whenever the user asks about a library, framework, SDK, API, CLI tool, or cloud service — even well-known ones like React, Next.js, Prisma, Express, Tailwind, Django, or Spring Boot. This includes API syntax, configuration, version migration, library-specific debugging, setup instructions, and CLI tool usage. Use even when you think you know the answer — your training data may not reflect recent changes. Prefer this over web search for library docs.

Do not use for: refactoring, writing scripts from scratch, debugging business logic, code review, or general programming concepts.

## Steps

1. Resolve library: `npx ctx7@latest library <name> "<what to look up>"` — use the official library name with proper punctuation (e.g., "Next.js" not "nextjs", "Customer.io" not "customerio", "Three.js" not "threejs")
2. Pick the best match (ID format: `/org/project`) by: exact name match, description relevance, code snippet count, source reputation (High/Medium preferred), and benchmark score (higher is better). If results don't look right, try alternate names or queries (e.g., "next.js" not "nextjs", or rephrase the question)
3. Fetch docs: `npx ctx7@latest docs <libraryId> "<what to look up>"` — run a separate `docs` command per distinct concept if the question spans multiple topics, unless it's about how they interact
4. Answer using the fetched documentation

You MUST call `library` first to get a valid ID unless the user provides one directly in `/org/project` format. Be specific about what to look up in the library's documentation — specific and detailed queries return better results than vague single words, but keep each query to a single concept unless the question is about how concepts interact; combined multi-topic queries dilute ranking and return shallow results for each topic. Do not run more than 3 commands per question. Do not include sensitive information (API keys, passwords, credentials) in queries.

For version-specific docs, use `/org/project/version` from the `library` output (e.g., `/vercel/next.js/v14.3.0`).

If a command fails with a quota error, inform the user and suggest `npx ctx7@latest login` or setting `CONTEXT7_API_KEY` env var for higher limits. Do not silently fall back to training data.
Run Context7 CLI requests outside Codex's default sandbox. If a Context7 CLI command fails with DNS or network errors such as ENOTFOUND, host resolution failures, or fetch failed, rerun it outside the sandbox instead of retrying inside the sandbox.
<!-- context7 -->
