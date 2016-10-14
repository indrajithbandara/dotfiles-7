# dotfiles
## Installation

    git clone git@github.com:booboy/dotfiles.git
	cd ~/.dotfiles

Source all of the files. Feel free to add to a script or just on cmd line

	for DOTFILE in `find $HOME/.dotfiles`
	do
  		[ -f “$DOTFILE” ] && source “$DOTFILE”
	done

