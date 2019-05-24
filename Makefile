SHELL := /bin/bash

DOTFILES := .bash .bash_history .bash_profile .bashrc .config .emacs .emacs.d .gitconfig .gvimrc .minttyrc .profile .vim .vimrc bin

VUNDLE_PATH := $(HOME)/.vim/bundle/Vundle.vim
HOMEBREW_BIN := /usr/local/bin/brew
RUBY_BIN := /usr/bin/ruby

OS := $(shell perl -e 'print $$^O')

MAC_BASIC := git make curl wget
MAC_CASKS := macvim iterm2 intellij-idea firefox-developer-edition slack
MAC_BREWS := mas tig htop fish tree

# Omni Graffle
MAC_APPS := 1142578753

.PHONY: setup tasks copy-files copy-fonts install-basics install-mac-tools vim-setup

setup: $(HOMEBREW_BIN) install-basics $(VUNDLE_PATH) copy-files copy-fonts

copy-files:
	@echo "Copying dotfiles to home directory..."
	cp -r $(DOTFILES) ~/

vim-setup:
	vim +PluginInstall +qall

$(VUNDLE_PATH):
	git clone https://github.com/VundleVim/Vundle.vim.git $@

$(HOMEBREW_BIN):
	$(RUBY_BIN) -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

copy-fonts:
	cp fonts/*.ttf $(HOME)/Library/Fonts/

tasks:
	@sh -c "cat Makefile | egrep \"^[[:alnum:][:punct:]]{0,}:[[:space:]]{0,}[[:alnum:][:punct:][:space:]]{0,}$$\""

install-basics:
	@echo "Installing basic tools..."
	@if [ "$(OS)" == "darwin" ]; then \
		for brew in $(MAC_BASIC); do \
			echo "Installing $$brew..."; \
			brew install $$brew && echo "Done."; \
		done; \
	 fi

install-mac-tools: install-mac-casks install-mac-brews install-mac-apps

install-mac-casks:
	@echo "Installing Homebrew casks..."
	@for cask in $(MAC_CASKS); do \
		echo "Installing $$cask..."; \
		brew cask install $$cask && echo "Done.";  \
	done

install-mac-brews:
	@echo "Installing Homebrew brews..."
	@for brew in $(MAC_BREWS); do \
		echo "Installing $$brew..."; \
		brew install $$brew && echo "Done."; \
	done

install-mac-apps:
	@echo "Installing Apps from app store..."
	for app in $(MAC_APPS); do  \
		echo "Installing $$app..."; \
		mas install $$app && echo "Done." \
	done
