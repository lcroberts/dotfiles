function r --wraps git --description "Navigate to git root"
    cd $(git rev-parse --show-toplevel)
end
