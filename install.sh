#!/bin/bash
# inspiration from https://github.com/webpro/dotfiles/blob/master/install.sh
# inspiration from https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789#.jfhvg130r

# PS1 COLOR
GREEN="\[\e[32m\]\u\[\e[m\]@\H\[\e[36m\][\[\e[m\]\[\e[33m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\]:"
RED=""\[\e[31m\]\u\[\e[m\]@\H\[\e[36m\][\[\e[m\]\[\e[33m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\]:"

# get current dir so script can run from anywhere
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# update dot files by pulling latest repo
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# run checks for color
if [[ $1 = "color=green" ]]; then
    echo "export PS1=$GREEN" >> "$DOTFILES_DIR/.envars"
fi

if [ $1 = "color=red" ]; then
    echo "export PS1=$RED" >> "$DOTFILES_DIR/.envars"
fi


# symlink our dotfiles to our users home dir so they can make use of all the good stuff in it
ln -sfv "$DOTFILES_DIR/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/.bashrc" ~
ln -sfv "$DOTFILES_DIR/.bash_aliases" ~
ln -sfv "$DOTFILES_DIR/.bash_functions" ~

ln -sfv "$DOTFILES_DIR/.envars" ~

ln -sfv "$DOTFILES_DIR/.vim" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~

# download and install vundle for vim plugins 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


