alias tmux='tmux -2'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#  Add config command for local conf files.  
#  This Alias allows adding and editing config files for each computer
#  Each computer can get a new branch
#  
#  To Create:
#    git init --bare $HOME/.myconf
#    config config status.showUntrackedFiles no
#  Ex:
#    config status
#    config add .vimrc
#    config commit -m "Add vimrc"
#    config add .config/redshift.conf
#    config commit -m "Add redshift config"
#    config push
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

genpasswd() {
    local l=$1
        [ "$l" == "" ] && l=16
        tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

kill_tmux() {
    w | awk '/\:0/ && /tmux -2/ {print $2}' | xargs -0 -I {} sh -c "ps aux | awk '/tmux/ && /pts\/3/'" | awk '{print $2}' | xargs kill
}

alias kinit='kinit mroote@SECURITYCOMPASS.COM'

alias ssh-agent-up='eval `ssh-agent -s` && ssh-add'
