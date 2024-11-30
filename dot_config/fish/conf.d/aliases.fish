abbr vi nvim
# Alias to enter generic tmux session
alias tenter="tmux new -As main"
alias deventer="distrobox-enter dev -- tmux -L dev new -As main 'exec fish'"
# Hibernate alias
abbr hibernate systemctl hibernate
# rm interactive mode alias
abbr rm rm -I

# git aliases
abbr g git
abbr gs git status
abbr gl git log
abbr glo git log --oneline
abbr ga git add
abbr gaa git add .
abbr gpu git push
abbr gp git pull
abbr gc --set-cursor "git commit -m \"%\""
abbr gco git checkout
abbr gd git diff
abbr gb git branch

function last_history_item
    echo $history[1]
end

abbr -a !! --position anywhere --function last_history_item

# eza aliases
set eza_modifiers "--git --icons --color-scale --group-directories-first"
alias l="eza $eza_modifiers"
alias ls="eza $eza_modifiers -lhg"
alias ll="eza $eza_modifiers -lbhmag"
alias la="eza $eza_modifiers -a"
alias lt="eza $eza_modifiers --tree"
alias llt="eza $eza_modifiers --tree -a"
alias lx="eza $eza_modifiers -lbhHgmUa"

alias firefox="flatpak run org.mozilla.firefox"
alias protontricks="flatpak run com.github.Matoking.protontricks"
alias protontricks-launch="flatpak run --command=protontricks-launch com.github.Matoking.protontricks"

# Movement aliases
abbr - cd -
abbr .. cd ..
abbr ... cd ../..
abbr .... cd ../../..
abbr ..... cd ../../../..
abbr ...... cd ../../../../..
abbr ....... cd ../../../../../..
abbr ........ cd ../../../../../../..
abbr ......... cd ../../../../../../../..
abbr .......... cd ../../../../../../../../..
abbr ........... cd ../../../../../../../../../..
abbr ............ cd ../../../../../../../../../../..
abbr ............. cd ../../../../../../../../../../../..
abbr .............. cd ../../../../../../../../../../../../..
abbr ............... cd ../../../../../../../../../../../../../..
abbr ................ cd ../../../../../../../../../../../../../../..

function take --wraps mkdir --description 'Make directory and enter'
    mkdir -p $argv && cd $argv
end

function pullall --description "Pull git repos within a subdirectory"
    pushd .
    set dirs "$HOME/Projects/" "$HOME/.config/nvim"
    for path in $dirs
        for dir in $(find $path -maxdepth 5  -type d -name .git | sed 's|/.git$||')
            cd $dir
            set_color blue
            echo "Entered $(pwd)"
            set_color normal
            git pull
            set_color green
            echo "Finished pull for repo in $dir"
            set_color normal
        end
    end
    popd
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
    set dirr $(find $argv | fzf-tmux -p 70%,75% --preview " [ -f {} ] && bat -f {} || eza -lah --color=always --tree {}")
    [ -d $dirr ] && cd $dirr && return
    [ -f $dirr ] && nvim $dirr && return
end

function gamescope_command --description "Echo used gamescope command"
    echo "gamescope -f -w 3840 -h 2160 -W 3840 -H 2160 -e -s 2.0 --adaptive-sync -- %command%"
    echo "If controller is not working try disabling steam input." 1>&2
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function frun --description "Fuzzily find and launch flatpaks"
    flatpak run (flatpak list --app | cut -f2 | fzf)
end


