# Auto completions
setopt AUTO_CD                      # Allows changing directories without needing to type 'cd'.
setopt AUTO_LIST                    # Automatically lists files if tab-completion is ambiguous.
setopt AUTO_MENU                    # Displays completion options automatically as you type.
setopt COMPLETE_IN_WORD             # Allows completion in the middle of a word, rather than just at the end.
#setopt MENU_COMPLETE               # Enable menu completion in Zsh.
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