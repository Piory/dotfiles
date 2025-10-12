# Claude Code Global Configuration

このファイルはClaude Codeのグローバル設定ファイルです。すべてのプロジェクトで共通して使用される設定やガイドラインを記載しています。

## Communication Guidelines

- **IMPORTANT**: プロジェクトに特定の言語指定がない限り、日本語で対応してください
- 簡潔で分かりやすいコミュニケーションを心がけてください

## Git Commit Guidelines

### Commit Message Format
- Use conventional commit format with emoji prefix: `:emoji: type(scope): description`
- Keep commit messages concise and descriptive
- **IMPORTANT**: All commit messages must be written in Japanese (日本語)
- **IMPORTANT**: Do NOT include "Generated with Claude Code" or similar AI-generated disclaimers in commit messages
- Focus on the actual changes made, not the tool used to make them

### Emoji Prefix Rules (Gitmoji Standard)

Choose appropriate emojis to represent different types of commits according to [gitmoji.dev](https://gitmoji.dev/) standard:

#### 🎯 Core Development
- 🎉 `:tada:` - Begin a project (プロジェクト開始)
- ✨ `:sparkles:` - Introduce new features (新機能)
- 🐛 `:bug:` - Fix a bug (バグ修正)
- 🚑️ `:ambulance:` - Critical hotfix (緊急修正)
- ⚡️ `:zap:` - Improve performance (パフォーマンス改善)
- 🎨 `:art:` - Improve structure / format of the code (コード構造・フォーマット改善)
- ♻️ `:recycle:` - Refactor code (コードリファクタリング)

#### 🔒 Security & Quality
- 🔒️ `:lock:` - Fix security or privacy issues (セキュリティ・プライバシー修正)
- 🔐 `:closed_lock_with_key:` - Add or update secrets (シークレット追加・更新)
- 🚨 `:rotating_light:` - Fix compiler / linter warnings (コンパイラ・リンター警告修正)
- ✅ `:white_check_mark:` - Add, update, or pass tests (テスト追加・更新・合格)
- 🧪 `:test_tube:` - Add a failing test (失敗テスト追加)

#### 📚 Documentation & UI
- 📝 `:memo:` - Add or update documentation (ドキュメント追加・更新)
- 💄 `:lipstick:` - Add or update the UI and style files (UI・スタイル更新)
- 💅 `:nail_care:` - Update UI and style files (UIファイル更新)
- 🎨 `:art:` - Improve structure / format of the code (コード構造改善)

#### 🚀 Deployment & CI/CD
- 🚀 `:rocket:` - Deploy stuff (デプロイ)
- 💚 `:green_heart:` - Fix CI Build (CIビルド修正)
- 👷 `:construction_worker:` - Add or update CI build system (CIビルドシステム更新)
- 📦️ `:package:` - Add or update compiled files or packages (パッケージ・コンパイル済みファイル更新)
- 🔖 `:bookmark:` - Release / Version tags (リリース・バージョンタグ)

#### ⚙️ Configuration & Dependencies
- 🔧 `:wrench:` - Add or update configuration files (設定ファイル更新)
- 🔨 `:hammer:` - Add or update development scripts (開発スクリプト更新)
- ⚙️ `:gear:` - Add or update configuration files (設定変更)
- ⬆️ `:arrow_up:` - Upgrade dependencies (依存関係アップグレード)
- ⬇️ `:arrow_down:` - Downgrade dependencies (依存関係ダウングレード)
- 📌 `:pushpin:` - Pin dependencies to specific versions (依存関係バージョン固定)

#### 🗂️ File Operations
- 🔥 `:fire:` - Remove code or files (コード・ファイル削除)
- 🚚 `:truck:` - Move or rename resources (リソース移動・リネーム)
- 📱 `:iphone:` - Work on responsive design (レスポンシブデザイン対応)
- 🍱 `:bento:` - Add or update assets (アセット追加・更新)
- 📄 `:page_facing_up:` - Add or update license (ライセンス追加・更新)

#### 🌐 Internationalization & Accessibility
- 🌐 `:globe_with_meridians:` - Internationalization and localization (国際化・地域化)
- ♿️ `:wheelchair:` - Improve accessibility (アクセシビリティ改善)
- 🏷️ `:label:` - Add or update types (型追加・更新)

#### 🔄 Development Process
- 🚧 `:construction:` - Work in progress (作業中)
- 🚀 `:rocket:` - Deploy stuff (デプロイ)
- 🔀 `:twisted_rightwards_arrows:` - Merge branches (ブランチマージ)
- ⏪️ `:rewind:` - Revert changes (変更の取り消し)
- 💥 `:boom:` - Introduce breaking changes (破壊的変更)

#### 🏗️ Architecture & Structure
- 🏗️ `:building_construction:` - Make architectural changes (アーキテクチャ変更)
- 🧱 `:bricks:` - Infrastructure related changes (インフラ関連変更)
- 📱 `:iphone:` - Work on responsive design (レスポンシブ対応)
- 🤖 `:robot:` - Add or update automated scripts (自動化スクリプト)

#### 🐳 DevOps & Environment
- 🐳 `:whale:` - Work about Docker (Docker関連)
- ☸️ `:wheel_of_dharma:` - Work about Kubernetes (Kubernetes関連)
- 🔧 `:wrench:` - Add or update configuration files (設定ファイル)

#### 🎯 Specific Categories
- 💸 `:money_with_wings:` - Remove code or files (コスト削減・最適化)
- 🍻 `:beers:` - Write code drunkenly (非推奨・技術的負債)
- 💬 `:speech_balloon:` - Add or update text and literals (テキスト・リテラル更新)
- 🗃️ `:card_file_box:` - Perform database related changes (データベース変更)
- 📊 `:bar_chart:` - Add or update analytics or track code (分析・トラッキング)

### Examples
```
✅ Good commit messages (Japanese with emojis):
✨ feat: ユーザー認証システムの追加
🐛 fix: Reactバージョン互換性の問題を解決
♻️ refactor: appからpresentationパッケージへの機能移動
📝 docs: README.mdのセットアップ手順を更新
🔧 chore: ESLint設定の調整
🚑️ hotfix: セキュリティ脆弱性の緊急修正
⚡️ perf: データベースクエリのパフォーマンス改善
💄 style: ログインフォームのUIデザイン更新
🔒️ security: JWTトークン検証の強化

❌ Avoid (English):
feat: add user authentication system

❌ Avoid (AI disclaimers):
feat: ユーザー認証システムの追加

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

### Benefits
- Makes commit messages more understandable and visually appealing
- Improves communication within the development team
- Creates a colorful and engaging repository history
- Helps quickly identify the nature of changes in git logs

## Code Quality Standards

### Naming Conventions
- Use `camelCase` for variables and functions
- Use `PascalCase` for classes, interfaces, and types
- Use `UPPER_SNAKE_CASE` for constants
- Prefer clear, descriptive names over abbreviated ones

### Security Guidelines
- Never commit secrets, API keys, or sensitive information
- Always sanitize user inputs
- Follow principle of least privilege
- Use secure authentication and authorization patterns

### Text and Documentation Guidelines
- **日本語テキスト内の英単語**: 日本語の文章やコメント、テスト名などで英単語を使用する場合、英単語の前後に半角スペースを追加してください
- **例**: 
  - ✅ 良い例: `imageUrl のみが指定された場合`
  - ❌ 悪い例: `imageUrlのみが指定された場合`
- **適用箇所**: 
  - テスト名 (`it()`, `describe()` 内の文字列)
  - コメント
  - ドキュメント
  - エラーメッセージ
  - ログメッセージ
- **目的**: 日本語と英語の混在テキストの可読性向上

## Development Best Practices

### Documentation
- Keep documentation up-to-date with code changes
- Write clear, concise comments for complex logic
- Maintain comprehensive README files for projects

### Testing
- Write tests for new features and bug fixes
- Maintain good test coverage
- Use meaningful test descriptions

### Performance
- Consider performance implications of code changes
- Optimize for readability first, then performance
- Profile and measure before optimizing