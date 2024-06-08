#!/bin/bash

if [ -f ~/.tmux.conf ]; then
	ln -s "$(pwd)/tmux/.tmux.conf" ~/.tmux.conf
fi

if [ ! -e ~/.tmux ]; then
	ln -s "$(pwd)/tmux" ~/.tmux
fi

if [ ! -d ~/.local/share/nvim/lazy/lazy.nvim ]; then
	git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
fi
