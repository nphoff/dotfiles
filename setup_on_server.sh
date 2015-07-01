#!/usr/bin/bash
# will copy over barebones files to a server.

SERVER=$1
ssh-copy-id -i ~/.ssh/id_rsa.pub nhoffman@$SERVER
scp ~/.zshrc $SERVER:~/.zshrc
scp ~/.vimrc $SERVER:~/.vimrc
scp ~/.tmux.conf $SERVER:~/.tmux.conf
