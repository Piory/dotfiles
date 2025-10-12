#!/bin/zsh

CONFIG_PATH="$HOME/.config"
NEOVIM_CONFIG_PATH="$HOME/.config/nvim"
DEIN_VIM_INSTALL_PATH="$HOME/.cache/dein"
NODE_VERSION='16.13.2'
CURRENT_DIRECTORY=$(pwd)

# add submodule
git submodule update --init --recursive
echo 'Start setup dotfiles!!!'

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                          Prezto                          │'
echo '╰──────────────────────────────────────────────────────────╯'
setopt EXTENDED_GLOB
for rcfile in $CURRENT_DIRECTORY/.zprezto/runcoms/^README.md(.N); do
  echo "Create symbolic link ["${ZDOTDIR:-$HOME}/.${rcfile:t}" -> $rcfile]]"
  ln -fs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                    IntelliJ IDEA 関連                    │'
echo '╰──────────────────────────────────────────────────────────╯'
echo "Create symbolic link [$CONFIG_PATH/.ideavimrc -> $HOME]"
ln -fs $CURRENT_DIRECTORY/.ideavimrc $HOME

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                          Neovim                          │'
echo '╰──────────────────────────────────────────────────────────╯'
echo "Create symbolic link [$CONFIG_PATH/nvim -> $CURRENT_DIRECTORY/.config/nvim]"
ln -fs $CURRENT_DIRECTORY/.config/nvim $CONFIG_PATH

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                       Git Config                         │'
echo '╰──────────────────────────────────────────────────────────╯'
echo "Create symbolic link [$CONFIG_PATH/git -> $CURRENT_DIRECTORY/.config/git]"
ln -fs $CURRENT_DIRECTORY/.config/git $CONFIG_PATH

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                          Other                           │'
echo '╰──────────────────────────────────────────────────────────╯'
dotfiles=(bin .zprezto .zshrc .zpreztorc .zprofile .p10k.zsh .tmux.conf .tmux .hyper.js .Brewfile .claude)
for file in $dotfiles; do
  echo "Create symbolic link [$HOME/$file -> $CURRENT_DIRECTORY/$file]"
  ln -fs $CURRENT_DIRECTORY/$file $HOME
done


echo '╭──────────────────────────────────────────────────────────╮'
echo '│                       Claude Code                        │'
echo '╰──────────────────────────────────────────────────────────╯'
# .claudeディレクトリの処理（存在する場合のみ）
if [[ -d ".claude" ]]; then
  # .claude内の各ファイルをシンボリックリンク
  for file in .claude/*; do
    if [[ -f "$file" ]]; then
      filename=$(basename "$file")
      echo "Creating symbolic link [$HOME/.claude/$filename -> $CURRENT_DIRECTORY/.claude/$filename]"
      ln -fs $CURRENT_DIRECTORY/.claude/$file $HOME/.claude/$filename
    fi
  done
  
  # .claude/commandsディレクトリの処理（ディレクトリ自体をシンボリックリンク）
  if [[ -d ".claude/commands" ]]; then
    # 既存の $HOME/.claude/commands を $HOME/.claude/commands.bk にリネーム
    if [[ -e $HOME/.claude/commands ]]; then
      echo "Backing up existing: $HOME/.claude/commands to $HOME/.claude/commands.bk"
      mv ~/.claude/commands ~/.claude/commands.bk
    fi
    echo "Creating symbolic link [$CURRENT_DIRECTORY/.claude/commands -> $HOME/.claude/commands]"
    ln -sf "$CURRENT_DIRECTORY/.claude/commands" $HOME/.claude/commands
  fi
fi

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                          Codex                           │'
echo '╰──────────────────────────────────────────────────────────╯'
# .codexディレクトリの処理（存在する場合のみ）
if [[ -d ".codex" ]]; then
  # .codex内の各ファイルをシンボリックリンク
  for file in .codex/*; do
    if [[ -f "$file" ]]; then
      filename=$(basename "$file")
      echo "Creating symbolic link [$HOME/.codex/$filename -> $CURRENT_DIRECTORY/.codex/$filename]"
      ln -fs $CURRENT_DIRECTORY/.codex/$file ${ZDOTDIR:-$HOME}/.codex/$filename
    fi
  done

  # .codex/prompts ディレクトリの処理（ディレクトリ自体をシンボリックリンク）
  if [[ -d ".codex/prompts" ]]; then
    # 既存の $HOME/.codex/prompts を $HOME/.codex/prompts.bk にリネーム
    if [[ -e $HOME/.codex/prompts ]]; then
      echo "Backing up existing: $HOME/.codex/prompts to $HOME/.codex/prompts.bk"
      mv $HOME/.codex/prompts $HOME/.codex/prompts.bk
    fi
    echo "Creating symbolic link [$CURRENT_DIRECTORY/.codex/prompts -> $HOME/.codex/prompts]"
    ln -sf "$CURRENT_DIRECTORY/.codex/commands" $HOME/.codex/commands
  fi
fi

source $CURRENT_DIRECTORY/.zshrc
source $CURRENT_DIRECTORY/.zpreztorc

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                      Install nodenv                      │'
echo '╰──────────────────────────────────────────────────────────╯'
if ! builtin command -v nodenv > /dev/null; then
  echo 'Install nodenv'
  yes | anyenv install nodenv
else
  echo 'Installed nodenv'
fi

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                       Install node                       │'
echo '╰──────────────────────────────────────────────────────────╯'
if ! builtin command -v node > /dev/null; then
  echo "Install node version is $NODE_VERSION"
  yes | nodenv install $NODE_VERSION
  nodenv rehash
  nodenv global $NODE_VERSION
else
  echo "Installed node (version: $(node -v))"
fi


echo '╭──────────────────────────────────────────────────────────╮'
echo '│                    Install ClaudeCode                    │'
echo '╰──────────────────────────────────────────────────────────╯'
npm install -g @anthropic-ai/claude-code

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                     Finish setup!!!                      │'
echo '╰──────────────────────────────────────────────────────────╯'
