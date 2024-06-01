# Removing the welcome prompt
set -g fish_greeting
set -x TERM xterm-256color

if [ -d /opt/homebrew/bin ]
	set PATH $PATH:/opt/homebrew/bin
	eval /opt/homebrew/bin/brew shellenv > /dev/null
end

if [ -d $HOME/.local/bin ]
	set -x PATH $PATH:$HOME/.local/bin
end

if  [ $USER = "rparodi" ]
	set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib
	set -x CPPFLAGS -I/opt/homebrew/opt/llvm/include
	set -x PATH $PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.nvm/versions/node/v22.1.0/bin/:$HOME/homebrew/bin:/opt/homebrew/opt/llvm/bin
end

for alias in ~/.config/fish/functions/alias/*
    source $alias
end

function fish_prompt
    set -l path (string replace -r "^$HOME" "~" $PWD)

	if test (whoami) = "root"
		set emoji '⛔ '
		set main_color D88C8C
		set secondary_color red
	else if test (hostname) = "enium"
		set emoji '🌐 '
		set main_color blue
		set secondary_color brcyan
		for tools in ~/.config/fish/functions/automations/*
			source $tools
		end
	else
		set emoji '🦑 '
		set main_color blue
		set secondary_color brcyan
	end

	set_color $main_color
    echo -n $emoji

	set_color $secondary_color
    echo -n '('$path')'
	__fish_git_prompt
    set_color $main_color
    echo -n ': '
    set_color normal
end

if type -q zoxide
    zoxide init fish | source
end

neofetch_ascii
