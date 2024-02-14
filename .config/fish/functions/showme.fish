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
