export GOPATH="$HOME/.local/share/go"
export NPM_PACKAGES="$HOME/.npm-packages"
# Add stuff to path with deduplication
typeset -U path PATH # Make path dedupe values
path=("$HOME/.local/neovim/bin" $path)
path=("$HOME/.local/bin" $path)
path=("/home/linuxbrew/.linuxbrew/bin" $path)
path+="$GOPATH/bin"
path+="$NPM_PACKAGES/bin"
path+=~/.cargo/bin
path+=~/.composer/vendor/bin
path+=~/Scripts
