if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    starship init fish | source
    bind -M insert \cn accept-autosuggestion
end
