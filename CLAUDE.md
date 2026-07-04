# CLAUDE.md

このファイルは、Claude Code（[claude.ai/code](https://claude.ai/code)）がこのリポジトリ内のコードを扱う際のガイドラインを提供するものです。

## リポジトリ概要

このリポジトリは、システム間で設定ファイル（dotfiles）を管理するための**個人用 dotfiles リポジトリ**です。シンボリックリンクを使用して、リポジトリ内の設定ファイルをホームディレクトリ内の所定の場所に接続します。

## 主要コマンド

### インストール

- `./install` - メインのインストールスクリプト。以下をセットアップします：
  - Prezto、Neovim、Git 設定、シェル設定ファイルのシンボリックリンク作成
  - nodenv および Node.js（v16.13.2）のインストール
  - Claude Code CLI ツールのインストール
- `./homebrew_install.sh` - `Brewfile` に定義された Homebrew パッケージをインストールします

### Git サブモジュール

- `git submodule update --init --recursive` - サブモジュールの初期化と更新（Prezto 利用のために必要）

### Neovim 設定

Neovim の設定は `.config/nvim/` にあり、**Luaベースの設定**で `lazy.nvim` をプラグインマネージャーとして使用しています。Neovim 設定を扱う際の注意点：

- プラグインの定義は `lua/plugins/` ディレクトリにあります
- LSP（Language Server Protocol）の設定は `lua/lsp/` にあります
- キーマッピングは `lua/keymaps.lua` にあります
- 設定変更後は Neovim 内で `:Lazy sync` を実行してプラグインを更新してください

## アーキテクチャ

### ディレクトリ構成

- `.config/` - アプリケーションごとの設定（nvim, git, sqls など）
- `.zprezto/` - Zsh の設定フレームワーク（Git サブモジュールで管理）
- `bin/` - カスタムスクリプトやバイナリ
- シェル設定：`.zshrc`, `.zpreztorc`, `.zprofile`, `.p10k.zsh`
- ターミナル設定：`.tmux.conf`, `.tmux/`, `.hyper.js`
- IDE 設定：`.ideavimrc`

### シンボリックリンク戦略

`install` スクリプトは以下のようにシンボリックリンクを作成します：

- `~/.config/nvim` → `./config/nvim`
- `~/.config/git` → `./config/git`
- `~/.ideavimrc` → `./.ideavimrc`
- Prezto の runcom ファイルはすべて `$HOME` にリンク
- シェル・ターミナル設定も `$HOME` にリンク

### パッケージ管理

- Homebrew パッケージは `Brewfile` 経由で `brew bundle` により管理
- Node.js は `anyenv` によってインストールされる `nodenv` で管理
- Neovim プラグインは `lazy.nvim` によって管理

## Claude Code との対話ルール

### 言語設定
- **すべてのやり取りは日本語で行ってください**
- コード内のコメント、コミットメッセージ、説明文など、すべての文章を日本語で記述してください
- 英語の技術用語（例：LSP、plugin など）はそのまま使用して構いません
