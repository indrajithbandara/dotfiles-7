#!/bin/bash
# this will install a local copy of python for the user

# change the version if you want a different version
# https://www.python.org/downloads/

py_version=2.7.12
download_url=https://www.python.org/ftp/python/2.7.12/Python-${py_version}.tar.xz

# download the python version and extract it
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p "$DOTFILES_DIR/python"
cd "$DOTFILES_DIR/python"
wget $download_url
tar xvf Python-${py_version}.tar.xz
find "$DOTFILES_DIR/python" -type d -exec chmod 0755 {} \;
cd Python-${py_version}


# okay now install it
./configure --prefix=$DOTFILES_DIR/python
make
make install

# update the users $PATH variable to include the newly installed python binary

export PATH="$DOTFILES_DIR/python/Python-${py_version}:$PATH" 
export PYTHONPATH="$DOTFILES_DIR/python/Python-${py_version}"
