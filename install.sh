#!/bin/zsh

CONFIG_PATH="$HOME/.config"
NEOVIM_CONFIG_PATH="$HOME/.config/nvim"
DEIN_VIM_INSTALL_PATH="$HOME/.cache/dein"
NODE_VERSION='16.13.2'
CURRENT_DIRECTORY=$(pwd)

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                    Start setup dotfiles                  │'
echo '╰──────────────────────────────────────────────────────────╯'
mkdir -p "$CONFIG_PATH"
echo 'make config directory ->' $CONFIG_PATH

# add submodule
git submodule update --init --recursive

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                           Brew                           │'
echo '╰──────────────────────────────────────────────────────────╯'
brew bundle install --file=$CURRENT_DIRECTORY/.Brewfile

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
if [[ -e "$CONFIG_PATH/nvim" && ! -L "$CONFIG_PATH/nvim" ]]; then
  echo "Backing up existing: $CONFIG_PATH/nvim to $CONFIG_PATH/nvim.bk"
  mv "$CONFIG_PATH/nvim" "$CONFIG_PATH/nvim.bk"
fi
echo "Create symbolic link [$CONFIG_PATH/nvim -> $CURRENT_DIRECTORY/.config/nvim]"
ln -sfn "$CURRENT_DIRECTORY/.config/nvim" "$CONFIG_PATH/nvim"

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                       Git Config                         │'
echo '╰──────────────────────────────────────────────────────────╯'
if [[ -e "$CONFIG_PATH/git" && ! -L "$CONFIG_PATH/git" ]]; then
  echo "Backing up existing: $CONFIG_PATH/git to $CONFIG_PATH/git.bk"
  mv "$CONFIG_PATH/git" "$CONFIG_PATH/git.bk"
fi
echo "Create symbolic link [$CONFIG_PATH/git -> $CURRENT_DIRECTORY/.config/git]"
ln -sfn "$CURRENT_DIRECTORY/.config/git" "$CONFIG_PATH/git"

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                      Ghostty Config                      │'
echo '╰──────────────────────────────────────────────────────────╯'
if [[ -e "$CONFIG_PATH/ghostty" && ! -L "$CONFIG_PATH/ghostty" ]]; then
  echo "Backing up existing: $CONFIG_PATH/ghostty to $CONFIG_PATH/ghostty.bk"
  mv "$CONFIG_PATH/ghostty" "$CONFIG_PATH/ghostty.bk"
fi
echo "Create symbolic link [$CONFIG_PATH/ghostty -> $CURRENT_DIRECTORY/.config/ghostty]"
ln -sfn "$CURRENT_DIRECTORY/.config/ghostty" "$CONFIG_PATH/ghostty"

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                       btop Config                        │'
echo '╰──────────────────────────────────────────────────────────╯'
if [[ -e "$CONFIG_PATH/btop" && ! -L "$CONFIG_PATH/btop" ]]; then
  echo "Backing up existing: $CONFIG_PATH/btop to $CONFIG_PATH/btop.bk"
  mv "$CONFIG_PATH/btop" "$CONFIG_PATH/btop.bk"
fi
echo "Create symbolic link [$CONFIG_PATH/btop -> $CURRENT_DIRECTORY/.config/btop]"
ln -sfn "$CURRENT_DIRECTORY/.config/btop" "$CONFIG_PATH/btop"

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                    Karabiner Config                      │'
echo '╰──────────────────────────────────────────────────────────╯'
if [[ -e "$CONFIG_PATH/karabiner" && ! -L "$CONFIG_PATH/karabiner" ]]; then
  echo "Backing up existing: $CONFIG_PATH/karabiner to $CONFIG_PATH/karabiner.bk"
  mv "$CONFIG_PATH/karabiner" "$CONFIG_PATH/karabiner.bk"
fi
mkdir -p "$CONFIG_PATH/karabiner"

if [[ -e "$CONFIG_PATH/karabiner/assets" && ! -L "$CONFIG_PATH/karabiner/assets" ]]; then
  echo "Backing up existing: $CONFIG_PATH/karabiner/assets to $CONFIG_PATH/karabiner/assets.bk"
  mv "$CONFIG_PATH/karabiner/assets" "$CONFIG_PATH/karabiner/assets.bk"
fi
echo "Create symbolic link [$CONFIG_PATH/karabiner/assets -> $CURRENT_DIRECTORY/.config/karabiner/assets]"
ln -sfn "$CURRENT_DIRECTORY/.config/karabiner/assets" "$CONFIG_PATH/karabiner/assets"

if [[ -e "$CONFIG_PATH/karabiner/karabiner.json" && ! -L "$CONFIG_PATH/karabiner/karabiner.json" ]]; then
  echo "Backing up existing: $CONFIG_PATH/karabiner/karabiner.json to $CONFIG_PATH/karabiner/karabiner.json.bk"
  mv "$CONFIG_PATH/karabiner/karabiner.json" "$CONFIG_PATH/karabiner/karabiner.json.bk"
fi
echo "Create symbolic link [$CONFIG_PATH/karabiner/karabiner.json -> $CURRENT_DIRECTORY/.config/karabiner/karabiner.json]"
ln -sfn "$CURRENT_DIRECTORY/.config/karabiner/karabiner.json" "$CONFIG_PATH/karabiner/karabiner.json"

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                       Mise Config                        │'
echo '╰──────────────────────────────────────────────────────────╯'
if [[ -e "$CONFIG_PATH/mise" && ! -L "$CONFIG_PATH/mise" ]]; then
  echo "Backing up existing: $CONFIG_PATH/mise to $CONFIG_PATH/mise.bk"
  mv "$CONFIG_PATH/mise" "$CONFIG_PATH/mise.bk"
fi
echo "Create symbolic link [$CONFIG_PATH/mise -> $CURRENT_DIRECTORY/.config/mise]"
ln -sfn "$CURRENT_DIRECTORY/.config/mise" "$CONFIG_PATH/mise"

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                          Other                           │'
echo '╰──────────────────────────────────────────────────────────╯'
dotfiles=(bin .zprezto .zshrc .zpreztorc .zprofile .p10k.zsh .tmux.conf .tmux .hyper.js .Brewfile)
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
      ln -fs "$CURRENT_DIRECTORY/$file" "$HOME/.claude/$filename"
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
    ln -sfn "$CURRENT_DIRECTORY/.claude/commands" "$HOME/.claude/commands"
  fi

  # .claude/skillsディレクトリの処理（ディレクトリ自体をシンボリックリンク）
  if [[ -d ".claude/skills" ]]; then
    # 既存の $HOME/.claude/skills を $HOME/.claude/skills.bk にリネーム（実体がディレクトリの場合のみ）
    if [[ -e "$HOME/.claude/skills" && ! -L "$HOME/.claude/skills" ]]; then
      echo "Backing up existing: $HOME/.claude/skills to $HOME/.claude/skills.bk"
      mv "$HOME/.claude/skills" "$HOME/.claude/skills.bk"
    fi
    echo "Creating symbolic link [$CURRENT_DIRECTORY/.claude/skills -> $HOME/.claude/skills]"
    ln -sfn "$CURRENT_DIRECTORY/.claude/skills" "$HOME/.claude/skills"
  fi
fi

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                          Codex                           │'
echo '╰──────────────────────────────────────────────────────────╯'
# .codexディレクトリの処理（存在する場合のみ）
if [[ -d ".codex" ]]; then
  mkdir -p "$HOME/.codex"
  echo "Creating symbolic link [$HOME/.codex/config.toml -> $CURRENT_DIRECTORY/.codex/config.toml]"
  ln -fs "$CURRENT_DIRECTORY/.codex/config.toml" "$HOME/.codex/config.toml"
  # .codex内の各ファイルをシンボリックリンク
  for file in .codex/*; do
    if [[ -f "$file" ]]; then
      filename=$(basename "$file")
      echo "Creating symbolic link [$HOME/.codex/$filename -> $CURRENT_DIRECTORY/.codex/$filename]"
      ln -fs "$CURRENT_DIRECTORY/$file" "$HOME/.codex/$filename"
    fi
  done

  # .codex/prompts ディレクトリの処理（ディレクトリ自体をシンボリックリンク）
  if [[ -d ".codex/prompts" ]]; then
    # 既存の $HOME/.codex/prompts を $HOME/.codex/prompts.bk にリネーム（実体がディレクトリの場合のみ）
    if [[ -e $HOME/.codex/prompts && ! -L $HOME/.codex/prompts ]]; then
      echo "Backing up existing: $HOME/.codex/prompts to $HOME/.codex/prompts.bk"
      mv $HOME/.codex/prompts $HOME/.codex/prompts.bk
    fi
    echo "Creating symbolic link [$CURRENT_DIRECTORY/.codex/prompts -> $HOME/.codex/prompts]"
    ln -sfn "$CURRENT_DIRECTORY/.codex/prompts" "$HOME/.codex/prompts"
  fi

  # .codex/skills ディレクトリの処理（ディレクトリ自体をシンボリックリンク）
  if [[ -d ".codex/skills" ]]; then
    # 既存の $HOME/.codex/skills を $HOME/.codex/skills.bk にリネーム（実体がディレクトリの場合のみ）
    if [[ -e $HOME/.codex/skills && ! -L $HOME/.codex/skills ]]; then
      echo "Backing up existing: $HOME/.codex/skills to $HOME/.codex/skills.bk"
      mv $HOME/.codex/skills $HOME/.codex/skills.bk
    fi
    echo "Creating symbolic link [$CURRENT_DIRECTORY/.codex/skills -> $HOME/.codex/skills]"
    ln -sfn "$CURRENT_DIRECTORY/.codex/skills" "$HOME/.codex/skills"
  fi
fi

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                         Skills                           │'
echo '╰──────────────────────────────────────────────────────────╯'
# .agents ディレクトリの処理（存在する場合のみ）
if [[ -d ".agents" ]]; then
  if [[ -e "$HOME/.agents" && ! -L "$HOME/.agents" ]]; then
    echo "Backing up existing: $HOME/.agents to $HOME/.agents.bk"
    mv "$HOME/.agents" "$HOME/.agents.bk"
  fi
  echo "Creating symbolic link [$HOME/.agents -> $CURRENT_DIRECTORY/.agents]"
  ln -sfn "$CURRENT_DIRECTORY/.agents" "$HOME/.agents"
fi

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                          Serena                          │'
echo '╰──────────────────────────────────────────────────────────╯'
if [[ -f "$CURRENT_DIRECTORY/.serena/serena_config.yml" ]]; then
  mkdir -p "$HOME/.serena"
  if [[ -e "$HOME/.serena/serena_config.yml" && ! -L "$HOME/.serena/serena_config.yml" ]]; then
    echo "Backing up existing: $HOME/.serena/serena_config.yml to $HOME/.serena/serena_config.yml.bk"
    mv "$HOME/.serena/serena_config.yml" "$HOME/.serena/serena_config.yml.bk"
  fi
  echo "Creating symbolic link [$HOME/.serena/serena_config.yml -> $CURRENT_DIRECTORY/.serena/serena_config.yml]"
  ln -sfn "$CURRENT_DIRECTORY/.serena/serena_config.yml" "$HOME/.serena/serena_config.yml"
fi

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                         OpenCode                         │'
echo '╰──────────────────────────────────────────────────────────╯'
# ~/.config/opencode が存在する場合のみ処理
if [[ -d "$HOME/.config/opencode" && -d "$CURRENT_DIRECTORY/.config/opencode" ]]; then
  # .config/opencode 内の各ファイル/ディレクトリをシンボリックリンク
  for entry in "$CURRENT_DIRECTORY/.config/opencode"/*; do
    if [[ -e "$entry" ]]; then
      entry_name=$(basename "$entry")
      target_path="$HOME/.config/opencode/$entry_name"
      if [[ -e "$target_path" && ! -L "$target_path" ]]; then
        echo "Backing up existing: $target_path to $target_path.bk"
        mv "$target_path" "$target_path.bk"
      fi
      echo "Creating symbolic link [$target_path -> $entry]"
      ln -sfn "$entry" "$target_path"
    fi
  done
fi

echo '╭──────────────────────────────────────────────────────────╮'
echo '│                          Gemini                          │'
echo '╰──────────────────────────────────────────────────────────╯'
# .geminiディレクトリの処理（存在する場合のみ）
if [[ -d ".gemini" ]]; then
  # .gemini内の各ファイルをシンボリックリンク
  for file in .gemini/*; do
    if [[ -f "$file" ]]; then
      filename=$(basename "$file")
      echo "Creating symbolic link [$HOME/.gemini/$filename -> $CURRENT_DIRECTORY/.gemini/$filename]"
      ln -fs "$CURRENT_DIRECTORY/$file" "$HOME/.gemini/$filename"
    fi
  done
  # Codex の AGENTS.md をシンボリックリンク
  echo "Creating symbolic link [$HOME/.gemini/AGENTS.md -> $CURRENT_DIRECTORY/.codex/AGENTS.md]"
  ln -fs "$CURRENT_DIRECTORY/.codex/AGENTS.md" "$HOME/.gemini/AGENTS.md"
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
echo '│                     Finish setup!!!                      │'
echo '╰──────────────────────────────────────────────────────────╯'
