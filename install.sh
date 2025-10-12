#!/bin/zsh

CONFIG_PATH="$HOME/.config"
NEOVIM_CONFIG_PATH="$HOME/.config/nvim"
DEIN_VIM_INSTALL_PATH="$HOME/.cache/dein"
NODE_VERSION='16.13.2'
CURRENT_DIRECTORY=$(pwd)

# add submodule
git submodule update --init --recursive
echo 'Start install neovim!!!'

echo ''
echo '######################################'
echo '##       Setup neovim config        ##'
echo '######################################'
# Prezto
setopt EXTENDED_GLOB
for rcfile in $CURRENT_DIRECTORY/.zprezto/runcoms/^README.md(.N); do
  echo "Create symbolic link ["${ZDOTDIR:-$HOME}/.${rcfile:t}" -> $rcfile]]"
  ln -fs "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "Create symbolic link [$CONFIG_PATH/.ideavimrc -> $HOME]"
ln -fs $CURRENT_DIRECTORY/.ideavimrc $HOME
echo "Create symbolic link [$CONFIG_PATH/nvim -> $CURRENT_DIRECTORY/.config/nvim]"
ln -fs $CURRENT_DIRECTORY/.config/git $CONFIG_PATH
echo "Create symbolic link [$CONFIG_PATH/git -> $CURRENT_DIRECTORY/.config/git]"
ln -fs $CURRENT_DIRECTORY/.config/nvim $CONFIG_PATH
dotfiles=(bin .zprezto .zshrc .zpreztorc .zprofile .p10k.zsh .tmux.conf .tmux .hyper.js .Brewfile .claude)
for file in $dotfiles; do
  echo "Create symbolic link [${ZDOTDIR:-$HOME}/$file -> $CURRENT_DIRECTORY/$file]"
  ln -fs $CURRENT_DIRECTORY/$file ${ZDOTDIR:-$HOME}
done

# .claudeディレクトリの処理（存在する場合のみ）
if [[ -d ".claude" ]]; then
  # .claude内の各ファイルをシンボリックリンク
  for file in .claude/*; do
    if [[ -f "$file" ]]; then
      filename=$(basename "$file")
      echo "Creating symbolic link [${ZDOTDIR:-$HOME}/.claude/$filename -> $CURRENT_DIRECTORY/.claude/$filename]"
      ln -fs $CURRENT_DIRECTORY/.claude/$file ${ZDOTDIR:-$HOME}/.claude/$filename
    fi
  done
  
  # .claude/commandsディレクトリの処理（ディレクトリ自体をシンボリックリンク）
  if [[ -d ".claude/commands" ]]; then
    # 既存の ~/.claude/commands を削除（ディレクトリまたはシンボリックリンク）
    if [[ -e ~/.claude/commands ]]; then
      echo "Removing existing: ~/.claude/commands"
      rm -rf ~/.claude/commands
    fi
    echo "Creating symlink: .claude/commands -> ~/.claude/commands"
    ln -sf "$DIR/.claude/commands" ~/.claude/commands
  fi
fi

source $CURRENT_DIRECTORY/.zshrc
source $CURRENT_DIRECTORY/.zpreztorc

echo ''
echo '######################################'
echo '##          Install nodenv          ##'
echo '######################################'
if ! builtin command -v nodenv > /dev/null; then
  echo 'Install nodenv'
  yes | anyenv install nodenv
else
  echo 'Installed nodenv'
fi

echo ''
echo '######################################'
echo '##           Install node           ##'
echo '######################################'
if ! builtin command -v node > /dev/null; then
  echo "Install node version is $NODE_VERSION"
  yes | nodenv install $NODE_VERSION
  nodenv rehash
  nodenv global $NODE_VERSION
else
  echo "Installed node (version: $(node -v))"
fi

echo ''
echo '######################################'
echo '##        Install ClaudeCode        ##'
echo '######################################'

npm install -g @anthropic-ai/claude-code

echo 'Neovim install completed!!!'
