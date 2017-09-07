#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source `which activate.sh` || echo 'install autoenv to properly use auto
environment switching in python' 
