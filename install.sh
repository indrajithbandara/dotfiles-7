#!/bin/bash
# inspiration from https://github.com/webpro/dotfiles/blob/master/install.sh
# inspiration from https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789#.jfhvg130r

# get current dir so script can run from anywhere
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# update dot files by pulling latest repo
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# symlink our dotfiles to our users home dir so they can make use of all the good stuff in it
ln -sfv "$DOTFILES_DIR/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/.bashrc" ~
ln -sfv "$DOTFILES_DIR/.bash_aliases" ~
ln -sfv "$DOTFILES_DIR/.bash_functions" ~
ln -sfv "$DOTFILES_DIR/.env" ~

# local programming languages
. "$DOTFILES_DIR/install/python.sh"

# pkg managers
. "$DOTFILES_DIR/pip.sh"
