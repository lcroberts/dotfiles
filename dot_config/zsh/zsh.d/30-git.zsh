# git aliases
alias gs="git status"
alias gsw="git switch"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
function gco() {
    if [[ -z "$1" ]]; then
        git checkout $(git branch | fzf)
    else
        git checkout $@
    fi
}
alias gb="git branch"
alias gd="git diff"
alias gp="git pull"
alias gf="git fetch"
alias gpu="git push"
alias gl="git log"
alias glo="git log --oneline"
alias glog="git log --oneline --graph"
alias gw="git worktree"
function r() {
    cd $(git rev-parse --show-toplevel)
}
function gwa() {
    if [[ -z "$1" ]]; then
        echo "Please provide a branch"
        return 1
    fi
    if git show-ref --verify --quiet refs/heads/$1; then
        echo "Branch exists"
        git worktree add $1 $1
    else
        echo "Branch doesn't exist"
        git worktree add -b $1 $1
    fi
}

function pullall() {
    find "$HOME/Projects/" -maxdepth 3 -name -prune -o -type d -name .git -prune -print -exec git -C {}/.. pull \;
}

