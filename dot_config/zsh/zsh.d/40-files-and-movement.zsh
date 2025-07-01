# eza aliases
eza_modifiers="--git --icons --color-scale --group-directories-first"
alias l="eza $eza_modifiers"
alias ls="eza $eza_modifiers -lhg"
alias ll="eza $eza_modifiers -lbhmag"
alias la="eza $eza_modifiers -a"
alias lt="eza $eza_modifiers --tree"
alias llt="eza $eza_modifiers --tree -a"
alias lx="eza $eza_modifiers -lbhHgmUa"

# Movement aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."
alias ...........="cd ../../../../../../../../../.."
alias ............="cd ../../../../../../../../../../.."
alias .............="cd ../../../../../../../../../../../.."
alias ..............="cd ../../../../../../../../../../../../.."
alias ...............="cd ../../../../../../../../../../../../../.."
alias ................="cd ../../../../../../../../../../../../../../.."

function tmp() {
    local tmp="/tmp/workspaces/$(xxd -l3 -ps /dev/urandom)"
    mkdir -p "$tmp"
    echo "$tmp"
    cd "$tmp"
}
function sd() {
    local dirr=$(find $argv | fzf-tmux -p 70%,75% --preview " [ -f {} ] && bat -f {} || eza -lah --color=always --tree {}")
    [ -d $dirr ] && cd $dirr && return
    [ -f $dirr ] && nvim $dirr && return
}

function showme() {
    if [[ -z "$@" ]]; then
        echo "Pass file to show"
        return 1
    fi
    local tmp="/tmp/workspaces/$(xxd -l3 -ps /dev/urandom)"
    mkdir -p "$tmp"
    7z x "$@" -o"$tmp"
    cd "$tmp" || return 1
    clear && l
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
