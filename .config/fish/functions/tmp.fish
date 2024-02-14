function tmp --description "Make a temporary workspace"
    set r "/tmp/workspaces/$(xxd -l3 -ps /dev/urandom)"
    mkdir -p "$r"
    echo "$r"
    cd "$r"
end
