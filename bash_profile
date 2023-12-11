export PATH="/Users/dom/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
for file in ~/.{bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi

hash brew &>/dev/null
if [ $? -eq 0 ]; then
	# Put npm bin on the PATH
	export PATH="/usr/local/share/npm/bin:$PATH"

	# If possible, add tab completion for many more commands
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		source $(brew --prefix)/etc/bash_completion
		# add completions for g alias
		complete -o default -o nospace -F _git g
	fi
fi

# python for ansible
# export PATH="$PATH:$HOME/Library/Python/2.7/bin"

# go exports
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if [[ -f $HOME/.bash_loke ]]; then
	source $HOME/.bash_loke
fi

# $DROPBOX/.extra can be used for settings you don’t want to commit
if [ -f $DROPBOX/.extra ]; then
	source $DROPBOX/bash/.extra
fi

export EDITOR=sublw
