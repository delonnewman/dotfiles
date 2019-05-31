SHELL := /bin/bash

DOTFILES := $(shell cat Manifest)

VUNDLE_PATH := $(HOME)/.vim/bundle/Vundle.vim
HOMEBREW_BIN := /usr/local/bin/brew
RUBY_BIN := /usr/bin/ruby
FONT_DIR := $(HOME)/Library/Fonts/

MAC_BASIC := git make curl wget mas

.PHONY: setup copy-files copy-fonts install-basics install-mac-tools upgrade-mac-tools vim-setup set-fish-shell

setup: $(HOMEBREW_BIN) install-basics $(VUNDLE_PATH) copy-files copy-fonts

copy-files:
	@echo "Copying dotfiles to home directory..."
	cp -r $(DOTFILES) ~/

show-files:
	@echo $(DOTFILES)

vim-setup:
	vim +PluginInstall +qall

$(VUNDLE_PATH):
	git clone https://github.com/VundleVim/Vundle.vim.git $@

$(HOMEBREW_BIN):
	$(RUBY_BIN) -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

copy-fonts:
	cp fonts/*.ttf $(FONT_DIR)

install-basics:
	@echo "Installing basic tools..."
	@if [ "$$(uname)" == "Darwin" ]; then \
		for brew in $(MAC_BASIC); do \
			echo "Installing $$brew..."; \
			brew install $$brew && echo "Done."; \
		done; \
	 fi

set-fish-shell:
	chsh -s /usr/bin/fish

install-mac-tools:
	brew bundle

upgrade-mac-tools:
	brew bundle check


help:
	@echo "NAME - Dotfiles Makefile"
	@echo "========================"
	@echo
	@echo "SYNOPSIS"
	@echo "========"
	@echo "\`\`\`"
	@echo "             setup - sets things up from scratch (installs homebrew, install basic tools for setup)"
	@echo "        copy-files - copies dotfiles to ~/"
	@echo "        show-files - shows files as they've been read from Manifiest"
	@echo "        copy-fonts - copy fonts from fonts/ to ~/Library/Fonts/"
	@echo "    install-basics - install basic tools"
	@echo " install-mac-tools - install tools for macOS (see Brewfile)"
	@echo " upgrade-mac-tools - upgrade tools for macOS (see Brewfile)"
	@echo "         vim-setup - install vim plugins"
	@echo "    set-fish-shell - set fish as the default shell (on POSIX systems)"
	@echo "\`\`\`"
