# where all the local things live!
if [ -e $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local;
fi

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
alias v='vim -O'
alias g='git'
alias vf='vim $(fzf)'

#start blogging
alias blog='cd ~/coding/ghost-0.7.1; nohup npm start &;'

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

#to_read
alias toread='v ~/to_read.txt'

#tmux
alias tma='tmux attach || tmux'
alias tmrm='tmux kill-session -t'
alias tmat='tmux attach -t'
alias tmn='tmux new -s'

# term stuff (for tmux characters)
export TERM=xterm-256color

#git!
alias git_delete_local_branches='g branch | grep -v master | xargs git branch -D'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
