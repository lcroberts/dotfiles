if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    bind -M insert \cn accept-autosuggestion
    bind -M insert \cr history-pager

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
    starship init fish | source
end
