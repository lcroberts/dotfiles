if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    set fish_cursor_insert line

    bind -M insert \cn accept-autosuggestion
    bind -M insert \cr history-pager
    bind -M insert \e\u0020 "commandline --insert ' '" # alt+space for space without abbr expansion

    # opam configuration
    source /var/home/logan/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

    direnv hook fish | source
    starship init fish | source
    zoxide init fish | source
end
