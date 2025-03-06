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
setopt autocd extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kamilc/.config/zsh/.zshrc'

source $DOTFILES/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme

autoload -Uz compinit
compinit
# End of lines added by compinstall

# +---------+
# + ALIASES +
# +---------+
alias docker-up="sudo systemctl start docker.service"
alias off="systemctl poweroff"
alias reboot="systemctl reboot"
alias l="eza -lah --icons --git --color -I .git"
alias lt="l -T"
alias lg="lazygit"
alias tree="tree -C"
alias cat="bat"
alias dive="podman run -ti --rm -v /run/user/1000/podman/podman.sock:/var/run/docker.sock:z wagoodman/dive"
alias lazypodman="DOCKER_HOST=unix:///run/user/1000/podman/podman.sock lazydocker"
alias system-update="dnf check-update --refresh; sudo dnf update; flatpak update"
alias venv-activate="[[ -d venv ]] && source venv/bin/activate || source .venv/bin/activate"
alias venv-deactivate="deactivate"

# To customize prompt, run `p10k configure` or edit ~/.config/dotfiles/zsh/.p10k.zsh.
[[ ! -f $DOTFILES/zsh/.p10k.zsh ]] || source $DOTFILES/zsh/.p10k.zsh
