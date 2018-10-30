#if [ -e ~/.screen/session-variables ]; then
    #alias ssh='source ~/.screen/session-variables; ssh'
#fi

#if [ -e ~/.screen/session-variables ]; then
    #alias git='source ~/.screen/session-variables; git'
#fi

if [ -e ~/scratch.sh ]; then
    alias screen='~/scratch.sh; screen'
fi

alias vi="vim"
alias ls="ls -alG"

alias rebase="git fetch upstream && git rebase upstream/master"
alias src="source ~/.bash_profile"

# tmux
alias dev="tmux a -t dev"
alias test="tmux a -t test"
alias tmtest="tmux new -s test"
alias tmdev="tmux new -s dev"

# git aliases
alias gg='git grep'
alias gs='git status'
