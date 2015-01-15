#!/bin/bash
cd "$(dirname "$0")"
#git pull
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" --exclude "Brewfile" -av . ~
}

function installStuff() {
	hash brew &>/dev/null
	if [ $? -ne 0 ]; then
		ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
	fi
	brew tap homebrew/boneyard
	brew bundle
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
	installStuff
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile
