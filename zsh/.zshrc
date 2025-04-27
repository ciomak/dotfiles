# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
export PATH="$HOME/.local/bin:$PATH"
export GOPATH="$XDG_DATA_HOME/go"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--color=border:#313244,label:#cdd6f4"

zstyle ':fzf-tab:*' fzf-flags $(echo $FZF_DEFAULT_OPTS)
# +-----------------+
# +   ZSH OPTIONS   +
# +-----------------+

# Auto completions
setopt AUTO_CD                      # Allows changing directories without needing to type 'cd'.
setopt AUTO_LIST                    # Automatically lists files if tab-completion is ambiguous.
setopt AUTO_MENU                    # Displays completion options automatically as you type.
setopt COMPLETE_IN_WORD             # Allows completion in the middle of a word, rather than just at the end.
setopt CDABLE_VARS                  # Enables named directories to be used like variables for `cd` commands.
setopt CORRECT                      # Automatically corrects minor spelling mistakes in directory names.
setopt PUSHD_IGNORE_DUPS            # Prevents `pushd` from adding duplicate entries in the directory stack.
setopt PUSHD_SILENT                 # Suppresses the output message when using `pushd` to switch directories.

# History settings
setopt APPEND_HISTORY               # Appends commands to history file rather than overwriting it.
setopt EXTENDED_HISTORY             # Saves timestamped entries in the history for each command.
setopt SHARE_HISTORY                # Shares command history across multiple terminal sessions.
setopt HIST_EXPIRE_DUPS_FIRST       # Removes the oldest duplicate entries from history first.
setopt HIST_IGNORE_DUPS             # Ignores consecutive duplicate entries in the history.
setopt HIST_IGNORE_ALL_DUPS         # Ignores all duplicates in history, even if they aren't consecutive.
setopt HIST_FIND_NO_DUPS            # Ensures that searching history with `Ctrl+R` skips duplicates.
setopt HIST_IGNORE_SPACE            # Ignores commands prefixed with a space in the history.
setopt HIST_SAVE_NO_DUPS            # Prevents saving duplicate commands in history when saving to a file.
setopt HIST_VERIFY                  # Asks for confirmation before executing commands found through history search.

unsetopt BEEP                       # Disables the terminal bell sound.

zle_highlight=('paste:none')        # Prevents highlighting of text when pasting into the terminal.

fpath=($DOTFILES/zsh/plugins/zsh-completions/src $DOTFILES/zsh/plugins/custom-completions $fpath)

autoload -Uz compinit
compinit

# +-------------+
# +   PLUGINS   +
# +-------------+

source $DOTFILES/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
source $DOTFILES/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
source $DOTFILES/zsh/plugins/fzf-tab-source/fzf-tab-source.plugin.zsh
source $DOTFILES/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $DOTFILES/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source $DOTFILES/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# +-------------+
# +   ALIASES   +
# +-------------+

alias docker-up="sudo systemctl start docker.service"
alias off="systemctl poweroff"
alias reboot="systemctl reboot"
alias l="eza -lahg --icons --git --color -I .git"
alias lt="l -T"
alias lg="lazygit"
alias tree="tree -C"
alias dive="podman run -ti --rm -v /run/user/1000/podman/podman.sock:/var/run/docker.sock:z wagoodman/dive"
alias lazypodman="DOCKER_HOST=unix:///run/user/1000/podman/podman.sock lazydocker"
alias system-update="dnf check-update --refresh; sudo dnf update; flatpak update"
alias venv-activate="[[ -d venv ]] && source venv/bin/activate || source .venv/bin/activate"
alias venv-deactivate="deactivate"
alias nv="nvim"

# +-----------------+
# +   KEYBINDINGS   +
# +-----------------+

bindkey -e
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.config/dotfiles/zsh/.p10k.zsh.
[[ ! -f $DOTFILES/zsh/.p10k.zsh ]] || source $DOTFILES/zsh/.p10k.zsh
