export HISTSIZE=10000
export HISTCONTROL=erasedups
export IGNOREEOF=5
shopt -s histappend

if [ -f ~/dotfiles/.bash_aliases ]; then
    . ~/dotfiles/.bash_aliases
fi

#if [ -e ~/.tmux-session-variables ]; then
    #alias ssh='source ~/.tmux-session-variables; ssh'
#fi

PS1='\[\033[01;32m\]\u@\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


#if [ -e ~/.save_ssh.sh ]; then
    #echo "save_ssh.sh"
    #alias tmux='~/.save_ssh.sh; tmux'
#fi

fixssh() {
	echo "fixssh called"
    for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
        if (tmux show-environment | grep "^${key}" > /dev/null); then
            value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
            export ${key}="${value}"
        fi
    done
}

ssh-reagent() {
	echo "ssh-reagent called"
	for agent in $SSH_AUTH_SOCK $STATIC_SSH_AUTH_SOCK /tmp/ssh-*/agent.*; do
		export SSH_AUTH_SOCK=$agent
		if ssh-add -l 2>&1 > /dev/null; then
			echo "Found working SSH Agent: ${SSH_AUTH_SOCK}"
			ssh-add -L
			return
		fi
		done
	echo "Cannot find ssh agent - maybe you should reconnect and forward it?"
}

SOCK="/tmp/ssh-agent-$USER-screen"
fixssh2() {
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
}
#export SSH_AUTH_SOCK=$HOME/.ssh/ssh_auth_sock

#if [ -e $HOME/bin/save-ssh-vars ]; then
	#alias screen='$HOME/bin/save-ssh-vars && screen'
	#alias tmux='$HOME/bin/save-ssh-vars && tmux'
#fi

#if test -v "TMUX"; then
    #export $(tmux show-env | grep SSH_AUTH_SOCK)
#fi
