SHELL := /bin/bash

DOTFILES := $(shell cat Manifest)
OS := $(shell uname)

VUNDLE_PATH := $(HOME)/.vim/bundle/Vundle.vim

HOMEBREW_BIN := /usr/local/bin/brew
RUBY_BIN := /usr/bin/ruby

MAC_TOOLS := git curl wget mas
MAC_FONT_DIR := $(HOME)/Library/Fonts/
MAC_INSTALL_CMD := brew install

LINUX_TOOLS := git curl wget
LINUX_FONT_DIR := $(HOME)/.local/share/fonts/
LINUX_INSTALL_CMD := guix install

ifeq ($(OS),Darwin)
FONT_DIR := $(MAC_FONT_DIR)
TOOLS := $(MAC_TOOLS)
INSTALL_CMD := $(MAC_INSTALL_CMD)
else
FONT_DIR := $(LINUX_FONT_DIR)
TOOLS := $(LINUX_TOOLS)
INSTALL_CMD := $(LINUX_INSTALL_CMD)
endif

.PHONY: setup copy-files copy-fonts install-basics install-tools upgrade-tools vim-setup set-fish-shell

setup: $(HOMEBREW_BIN) install-basics $(VUNDLE_PATH) copy-files copy-fonts

copy-files:
	@echo "Copying dotfiles to home directory..."
	cp -r $(DOTFILES) ~/

show-files:
	@echo $(DOTFILES)

vim-setup: $(VUNDLE_PATH)
	vim +PluginInstall +qall

$(VUNDLE_PATH):
	git clone https://github.com/VundleVim/Vundle.vim.git $@

$(HOMEBREW_BIN):
	$(RUBY_BIN) -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

$(FONT_DIR):
	mkdir -p $(FONT_DIR)

copy-fonts: $(FONT_DIR)
	cp fonts/*.ttf $(FONT_DIR)

install-basics:
	@echo "Installing basic tools..."
	@for pkg in $(TOOLS); do \
		echo "Installing $$pkg..."; \
		$(INSTALL_CMD) $$pkg && echo "Done."; \
	done

set-fish-shell:
	chsh -s /usr/bin/fish

install-tools:
ifeq ($(OS),Darwin)
	brew bundle
endif

upgrade-tools:
ifeq ($(OS),Darwin)
	brew bundle check
endif

help:
	@echo "Dotfiles - Makefile"
	@echo
	@echo "      OS: $(OS)"
	@echo "   Tasks:"
	@echo "           setup - sets things up from scratch (installs homebrew, install basic tools for setup)"
	@echo "      copy-files - copies dotfiles to ~/"
	@echo "      show-files - shows files as they've been read from Manifiest"
	@echo "      copy-fonts - copy fonts from fonts/ to $(FONT_DIR)"
	@echo "  install-basics - install basic tools"
	@echo "   install-tools - install tools"
	@echo "   upgrade-tools - upgrade tools"
	@echo "       vim-setup - install vim plugins"
	@echo "  set-fish-shell - set fish as the default shell (on POSIX systems)"
	@echo
