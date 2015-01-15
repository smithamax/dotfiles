#!/bin/bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
git clone https://github.com/smithamax/dotfiles
cd dotfiles
./bootstrap.sh -f
