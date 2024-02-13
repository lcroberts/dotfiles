function j --wraps autojump --description 'cd autojump'
    cd $(autojump $argv)
end
