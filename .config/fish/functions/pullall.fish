function pullall
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
