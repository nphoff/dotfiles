# where all the local things live!
if [ -e $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local;
fi

bindkey -v
export KEYTIMEOUT=1

export GIT_EDITOR=vim
export EDITOR=vim
export VISUAL=vim
export TERM=screen-256color

# Lang settings:
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

#ALIASES!
alias e='emacs'
alias v='vim'

#Ease of changing directories:
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'
alias ..7='cd ../../../../../../..'
alias ..8='cd ../../../../../../../..'
alias ..9='cd ../../../../../../../../..'


#tmux
alias tma='tmux attach || tmux'
alias tmrm='tmux kill-session -t'
alias tmat='tmux attach -t'
alias tmn='tmux new -s'
