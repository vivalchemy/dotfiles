# +------------------------+
# | Autostart TMUX session |
# +------------------------+
if command -v tmux >/dev/null 2>&1; then
  if [ -z "$TMUX" ]; then
    if ! tmux has-session -t default 2>/dev/null; then
      tmux new-session -s default
    else
      tmux attach-session -t default
    fi
  fi
fi

# +-----------------------------------------------------+

source "$ZDOTDIR/utils/include.zsh"

# +-------------------------------+
# | Files which modify zsh itself |
# +-------------------------------+
# the completion config is included at file end
include "core/history"
include "core/aliases"
include "core/functions"
include "core/keymaps"
include "core/options"
# include "core/old_prompt"
# include "core/env"

# +------------------------+
# | Plugin manager for zsh |
# +------------------------+
include "plugins/native/zap"

# +------------------------------------+
# | Plugins made specifically for zsh  |
# +------------------------------------+
include "plugins/native/starship"
# include "plugins/native/supercharge" # only the reload feature is worth it rest are mediocre
include "plugins/native/zsh-autosuggestions"
include "plugins/native/zsh-syntax-highlighting"
include "plugins/native/zsh-vi-mode"
include "plugins/native/zsh-completions"

# +-----------------------------------------------------+

fastfetch

# +-----------------------------------------------------+


# +-----------------------------------------------------+
# | Plugins which help interacting with other cli tools |
# +-----------------------------------------------------+
include "plugins/external/bun"
include "plugins/external/cpp"
include "plugins/external/docker"
include "plugins/external/fastfetch"
include "plugins/external/fzf"
include "plugins/external/git"
include "plugins/external/go"
include "plugins/external/hexyl"
include "plugins/external/lazydocker"
include "plugins/external/lazygit"
include "plugins/external/man"
include "plugins/external/neovim"
include "plugins/external/pacman"
include "plugins/external/pnpm"
include "plugins/external/pocketbase"
include "plugins/external/rofi"
include "plugins/external/rust"
include "plugins/external/sdkman"
include "plugins/external/swayimg"
include "plugins/external/tmux"
include "plugins/external/vscode"
include "plugins/external/yazi"
include "plugins/external/zed"
include "plugins/external/zen-browser"
include "plugins/external/zoxide"

# +---------------------------------------------+
# | Completion needs to be loaded after plugins |
# +---------------------------------------------+
include "core/completions"
