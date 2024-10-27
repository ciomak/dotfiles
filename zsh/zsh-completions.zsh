# Add custom completion paths to `fpath`, which stores directories for Zsh functions.
# This includes directories from $DOTFILES for custom completions and zsh-completions.
fpath=($DOTFILES/zsh/plugins/completions $DOTFILES/zsh/plugins/zsh-completions/src $fpath)

# Should be called before compinit to load the completion module.
zmodload zsh/complist

# Load completion functions and initialize them.
autoload -U compinit; compinit
_comp_options+=(globdots) # Include hidden files (dotfiles) in completion results.

# Define the completion methods used in order.
# _extensions: custom extensions, _complete: standard completion, _approximate: handles typos.
zstyle ':completion:*' completer _extensions _complete _approximate

# Use a cache for command completions to speed up loading.
zstyle ':completion:*' use-cache on

# Specify the path where the completion cache is stored.
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Allow alias expansion when using `_expand_alias`.
zstyle ':completion:*' complete true

# Enables menu-based selection for completion options.
zstyle ':completion:*' menu select

# Allows completion options to be fully shown.
zstyle ':completion:*' complete-options true

# Format for displaying corrections when suggestions have errors.
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'

# Format for displaying descriptions of completion options.
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'

# Format for displaying messages during completion.
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'

# Format for warnings when no matches are found during completion.
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# Customize the prompt displayed when multiple matches are found during autocompletion.
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Customize the color of completion listings to match `LS_COLORS` for files and directories.
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# When using `cd`, only display specific tags for completion, like local directories and path directories.
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories

# Customize the order of tags used during autocompletion for the first argument of git commands.
# zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases

# Group completion results for better organization.
zstyle ':completion:*' group-name ''

# Order of completion groups for command completions.
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# Custom matcher for case-insensitive completion and handling characters like `.` and `-`.
# See the ZSHCOMPWID documentation for details on completion matching.
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Keep the prefix typed by the user during completion.
zstyle ':completion:*' keep-prefix true

# Load Google Cloud SDK completions if the file exists.
if [[ -f /usr/share/google-cloud-sdk/completion.zsh.inc ]]; then 
    source /usr/share/google-cloud-sdk/completion.zsh.inc 
fi