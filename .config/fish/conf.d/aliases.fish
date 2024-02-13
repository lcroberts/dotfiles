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
