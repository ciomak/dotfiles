# Custom function to override default `fzf` UI and show directories preview
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)           fd --file d --hidden --follow . 2>/dev/null | fzf --preview 'tree -C {}' "$@";;
        tree)         fd --file d --hidden --follow . 2>/dev/null | fzf --preview 'tree -C {}' "$@";;
        *)            fzf "$@" ;;
    esac
}

# Custom function for `fzf` to generate file paths.
_fzf_compgen_path() {
    rg --files --glob "!.git" "$1"
}

# Custom function for `fzf` to generate directory paths.
_fzf_compgen_dir() {
   fd --file d --hidden --follow --exclude ".git" "$1"
}

fwork() {
    result=$(find ~/workspace/* -file d -prune -exec basename {} ';' | sort | uniq | nl | fzf | cut -f 2)
    [ -n "$result" ] && cd ~/workspace/$result
}
