alias vim='nvim'
# Archlinux update
alias upgrade="paru -Syu"
# Alias to enter generic tmux session
alias tenter="tmux new -As main"
# Hibernate alias
alias hibernate="systemctl hibernate"
# rm interactive mode alias
alias rm="rm -I"
# tar multithreading
alias tar="tar --use-compress-program=pigz"

# eza aliases
set eza_modifiers "--git --icons --color-scale --group-directories-first"
alias l="eza $eza_modifiers"
alias ls="eza $eza_modifiers -lhg"
alias ll="eza $eza_modifiers -lbhmag"
alias la="eza $eza_modifiers -a"
alias lt="eza $eza_modifiers --tree"
alias llt="eza $eza_modifiers --tree -a"
alias lx="eza $eza_modifiers -lbhHgmUa"

# Movement aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'
alias ...........='cd ../../../../../../../../../..'
alias ............='cd ../../../../../../../../../../..'
alias .............='cd ../../../../../../../../../../../..'
alias ..............='cd ../../../../../../../../../../../../..'
alias ...............='cd ../../../../../../../../../../../../../..'
alias ................='cd ../../../../../../../../../../../../../../..'


function j --wraps autojump --description 'cd autojump'
    cd $(autojump $argv)
end

function pullall --description "Pull git repos within a subdirectory"
    for dir in $(find . -maxdepth 5  -type d -name .git | sed 's|/.git$||')
        cd $dir
        set_color blue
        echo "Entered $(pwd)"
        set_color normal
        git pull
        set_color green
        echo "Finished pull for repo in $dir"
        set_color normal
        cd -
    end
end

function r --wraps git --description "Navigate to git root"
    cd $(git rev-parse --show-toplevel)
end

function showme --description "Unzip provided archive into tmp directory"
    if test -z $argv
        echo "Pass file to show"
        return 1
    end
    set tmp "/tmp/workspaces/$(xxd -l3 -ps /dev/urandom)"
    mkdir -p "$tmp"
    7z x "$argv" -o"$tmp"
    cd "$tmp" || return 1
    clear && echo && echo "$argv" && ls
end

function tmp --description "Make a temporary workspace"
    set r "/tmp/workspaces/$(xxd -l3 -ps /dev/urandom)"
    mkdir -p "$r"
    echo "$r"
    cd "$r"
end

function sd
    set dirr $(fd $argv | fzf-tmux -p 70%,75% --preview " [ -f {} ] && bat -f {} || eza -lah --color=always --tree {}")
    [ -f $dirr ] && nvim $dirr && return
    [ -d $dirr ] && cd $dirr && return
end
