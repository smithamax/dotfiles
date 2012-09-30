export PATH="$HOME/bin:$PATH"

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

hash brew &>/dev/null
if [ $? -eq 0 ]; then
	# Put npm bin on the PATH
	export PATH="/usr/local/share/npm/bin:$PATH"
	# Python on path
	export PATH="/usr/local/share/python:$PATH"

	# If possible, add tab completion for many more commands
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi
fi

# Load RVM into a shell session *as a function*
[[ -r "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
