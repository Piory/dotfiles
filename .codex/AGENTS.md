# 品質保証ルール
- 必ず日本語で回答すること
- ハルシネーション禁止：事実確認できない内容を断言しないこと
- 不明な場合は「わかりません」と答える
- 推測の場合は必ず「（推測です）」と明記する
- 明確な指示がわからない場合は質問して確認すること。憶測で作業を進めないこと
- コミットやコミットメッセージを生成する際は、それだけに集中し、他もファイルを変更しないこと
- セキュリティに関する内容は特に慎重に扱い、誤情報を提供しないこと
- 余計な作業は行わないこと。指示された内容にのみ集中すること
- 認知していない変更があった場合は、元に戻さずに意図的な変更か必ずユーザーへ確認すること
- Pythonなどのコード実行を禁止します。ただし、`.agents/skills` 内の Python ファイル実行は許可します。
- 指示があるまで PR の作成は行わないこと
- ライブラリの使い方を確認する際は Context7 MCP を使用すること

# ファイルの参照ルール
- Serena MCP を使用する対象は、Codex が参照しているワークスペース内のファイルのみとすること
- ワークスペース外のファイル取得には Serena MCP を使用しないこと
- スキル関連の取得には Serena MCP を使用しないこと

# Workflow Orchestration

## 1. Plan Node Default
- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions)
- If something goes sideways, STOP and re-plan immediately - don't keep pushing
- Use plan mode for verification steps, not just building
- Write detailed specs upfront to reduce ambiguity

## 2. Subagent Strategy
- Use subagents liberally to keep main context window clean
- Offload research, exploration, and parallel analysis to subagents
- For complex problems, throw more compute at it via subagents
- One tack per subagent for focused execution

## 3. Self-Improvement Loop
- After ANY correction from the user: update `tasks/lessons.md` with the pattern
- Write rules for yourself that prevent the same mistake
- Ruthlessly iterate on these lessons until mistake rate drops
- Review lessons at session start for relevant project

## 4. Verification Before Done
- Never mark a task complete without proving it works
- Diff behavior between main and your changes when relevant
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, demonstrate correctness

## 5. Demand Elegance (Balanced)
- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: "Knowing everything I know now, implement the elegant solution"
- Skip this for simple, obvious fixes - don't over-engineer
- Challenge your own work before presenting it

## 6. Autonomous Bug Fixing
- When given a bug report: just fix it. Don't ask for hand-holding
- Point at logs, errors, failing tests - then resolve them
- Zero context switching required from the user
- Go fix failing CI tests without being told how

# Task Management

1. **Plan First**: Write plan to `tasks/todo.md` with checkable items
2. **Verify Plan**: Check in before starting implementation
3. **Track Progress**: Mark items complete as you go
4. **Explain Changes**: High-level summary at each step
5. **Document Results**: Add review section to `tasks/todo.md`
6. **Capture Lessons**: Update `tasks/lessons.md` after corrections

# Core Principles

- **Simplicity First**: Make every change as simple as possible. Impact minimal code.
- **No Laziness**: Find root causes. No temporary fixes. Senior developer standards.
- **Minimat Impact**: Changes should only touch what's necessary. Avoid introducing bugs.
