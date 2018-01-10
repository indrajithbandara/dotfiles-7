# aliases
alias l='ls -lah'
alias ll='ls -lah'
alias ls='ls --color=auto'

alias functions="grep \(\) ~/.bash_functions  | grep -E -v '\#|\*'"
alias Grep='grep'
alias dict='/usr/bin/sdcv'
alias wiki='/usr/bin/python2 ~/bin/mygit/misc_pytools/wikipedia_search/wikipedia_search.py' 
alias btc='curl -sSL https://coinbase.com/api/v1/prices/historical | head -n 1 | sed "s|^.*,|$|" | sed "s|\(\.[0-9]$\)|\10|"'
alias rfc="/home/booboy/bin/mygit/rfc/rfc.sh"
alias current_temp='python3 /home/booboy/bin/mygit/misc_pytools/get_weather/weather.py |grep "\"temp\":" | tr -d ','| column -t'
