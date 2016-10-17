# dotfiles
## Installation

    git clone git@github.com:booboy/dotfiles.git
	cd ~/.dotfiles

The way that I am experimenting with this now as I continue development on it. 
	useradd -m testuser 
	sudo su testuser - 
	cd ~ && git clone https://github.com/booboy/dotfiles.git && cd dotfiles
	source install.sh

This should take care of setting up symlinks to .bashrc .bash_aliases .bash_functions .bash_profile and also installing a version of python local to the user for that shel session. 
I am still working on making the new shells use the local python enviroment. I will have that ready soon. 
