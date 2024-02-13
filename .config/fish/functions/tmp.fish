function tmp
    set r "/tmp/workspaces/$(xxd -l3 -ps /dev/urandom)"
    mkdir -p "$r"
    echo "$r"
    cd "$r"
end
