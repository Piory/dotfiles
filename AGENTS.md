# Repository Guidelines

## Project Structure & Module Organization
This repo manages dotfiles, Neovim modules, and shell tooling that are symlinked into your home directory via `install`.
- `.config/nvim/` holds the Lua-based Neovim stack: `init.lua` loads modules in `lua/`, plugin specs in `lua/plugins/`, and per-plugin configs in `lua/setup/`.
- `.config/git/` and `.config/sqls/` provide application configs that map to `~/.config/`; update them here instead of editing live copies.
- `.zprezto/` is tracked as a submodule; runcom templates populate `.zshrc`, `.zpreztorc`, `.p10k.zsh`, and related shell files at `$HOME`.
- `bin/` contains custom Zsh helpers such as `functions.zsh` (fzf navigation shortcuts) and `tmux-ide.zsh`; `Brewfile` and `homebrew_install.sh` define Homebrew dependencies.

## Build, Test, and Development Commands
- `git submodule update --init --recursive` — refresh Prezto and any nested modules before running installers.
- `./install` — symlink dotfiles, source Prezto configs, install `nodenv`, and set Node.js `16.13.2`.
- `./homebrew_install.sh` — run `brew doctor`, update, upgrade, and apply `brew bundle` against `Brewfile`.
- `nvim --headless "+Lazy sync" +qa` — install or update Neovim plugins after editing anything under `.config/nvim/`.
- `brew bundle check` — confirm all declared formulae and casks resolve.

## Coding Style & Naming Conventions
- Lua files use two-space indentation, descriptive module names (`options`, `keymaps`, `setup.*`), and inline Japanese comments where clarification helps.
- Zsh scripts favor hyphenated function names (`cd-fzf`, `ghq-fzf`) and should stay POSIX-friendly; prefer `builtin command -v` for dependency checks.
- Keep configuration values declarative and avoid embedding machine-specific secrets; introduce overrides through environment variables when required.

## Testing Guidelines
- No automated test suite exists; rely on targeted checks: `nvim --headless "+checkhealth" +qa` for Neovim, `zsh -n .zshrc` for syntax, and `tmux source-file ~/.tmux.conf` after tmux changes.
- After running `./install`, confirm new symlinks with `ls -l ~ | grep` for the affected files before committing.

## Commit & Pull Request Guidelines
- Follow the current log style: concise, present-tense messages (Japanese or English) that focus on the affected area, e.g., `nvim: プラグイン設定を整理`.
- Group related dotfile updates per commit to simplify rollback.
- PRs should summarize scope, list verification commands run, mention any manual symlink steps, and link issues or screenshots when UI-facing tools change.

## Security & Configuration Tips
- Review scripts that invoke remote installers (`homebrew_install.sh`, `install`) before altering URLs.
- Never check in credentials, API tokens, or machine-local overrides; prefer documenting necessary environment variables in `README.md` or this guide.
