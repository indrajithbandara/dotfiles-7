#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source `which activate.sh` || echo 'install autoenv to properly use auto
environment switching in python' 

PATH="/home/booboy/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/booboy/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/booboy/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/booboy/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/booboy/perl5"; export PERL_MM_OPT;
