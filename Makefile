out ?= ${HOME}

mkdir = @mkdir -p $(dir $@)

$(out)/.%: %
	$(mkdir)
	cp $< $@

dotfiles.in := aliases bash_profile bash_prompt bashrc cheat exports functions git-prompt.sh gitconfig gitignore_global inputrc
dotfiles.out := $(patsubst %, $(out)/.%, $(dotfiles.in))

all: $(dotfiles.out)
