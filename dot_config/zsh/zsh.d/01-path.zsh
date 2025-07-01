# Add stuff to path with deduplication
typeset -U path PATH # Make path dedupe values
path+=~/.local/nvim/bin
path+=~/.local/share/bob/nvim-bin
path+=~/.local/share/go/bin
path+=~/.npm-packages/bin
path+=~/.cargo/bin
path+=~/.local/bin
path+=~/Scripts
path+=~/.composer/vendor/bin
path+=/home/linuxbrew/.linuxbrew/bin
path+=~/.cargo/bin
path+=~/.local/bin
path+=~/Scripts
