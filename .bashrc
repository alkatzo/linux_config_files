#!/bin/bash 

#######################################################
# Export all functions from this file
#######################################################
#set -a

#######################################################

# Source global definitions
if [ -f /etc/bashrc ]; then
	 . /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

if [ -d ~/.bashrc.d ]; then
  for rc in $(/bin/ls ~/.bashrc.d/); do
    source $rc
  done
fi

#######################################################
# EXPORTS
#######################################################
iatest=$(expr index "$-" i)

# Disable the bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=5000

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
#PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
#stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=01;38;5;27:ln=0;38;5;14:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=0;38;5;10:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
export GREP_OPTIONS='--color=auto' #deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


#######################################################
# GENERAL ALIAS'S
#######################################################
# To temporarily bypass an alias, we preceed the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Edit this .bashrc file
alias ebrc='edit ~/.bashrc'

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Alias's to modified commands
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias multitail='multitail --no-repeat -c'
alias vi='vim'
alias svi='sudo vi'
alias vis='vim "+set si"'

# Change directory aliases
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Alias's for multiple directory listing commands
alias la='ls -Alh' # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='command ls -l --color=always' # long listing format no hidden files
alias l='ls -Fl' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only

# Search command line history
alias h="history | grep "

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# SHA1
alias sha1='openssl sha1'


#######################################################
# Set the ultimate amazing command prompt
#######################################################

alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"
function __setprompt
{
	local LAST_COMMAND=$? # Must come first!

	# Define colors
	local LIGHTGRAY="\e[38;5;7m"
	local DARKGRAY="\e[38;5;8m"
	local WHITE="\e[38;5;15m"
	local BLACK="\e[38;5;16m"
	local RED="\e[38;5;1m"
	local LIGHTRED="\e[38;5;9m"
	local GREEN="\e[38;5;2m"
	local LIGHTGREEN="\e[38;5;2m"
	local BROWN="\e[38;5;3m"
	local YELLOW="\e[38;5;11m"
	local BLUE="\e[38;5;27m"
	local LIGHTBLUE="\e[38;5;45m"
	local MAGENTA="\e[38;5;13m"
	local LIGHTMAGENTA="\e[38;5;219m"
	local CYAN="\e[38;5;6m"
	local LIGHTCYAN="\e[38;5;14m"
	local NOCOLOR="\e[00m"

	PS1=""

	# User and server
	local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
	local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
	if [ $SSH2_IP ] || [ $SSH_IP ] ; then
		PS1+="\[${GREEN}\]\u\[${LIGHTGRAY}\]@\[${RED}\]\h"
	else
		PS1+="\[${GREEN}\]\u\[${LIGHTGRAY}\]@\[${BROWN}\]\h"
	fi

	# Current directory
	PS1+="\[${LIGHTGRAY}\]:\w"

	if [[ $EUID -ne 0 ]]; then
		PS1+="\[${GREEN}\]>\[${NOCOLOR}\] " # Normal user
	else
		PS1+="\[${RED}\]>\[${NOCOLOR}\] " # Root user
	fi

	# PS2 is used to continue a command using the \ character
	PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "

	# PS3 is used to enter a number choice in a script
	PS3='Please enter a number from above list: '

	# PS4 is used for tracing a script in debug mode
	PS4='$LINENO: '
}
PROMPT_COMMAND='__setprompt'


########################################################
########################################################
#                       functions                      #
########################################################
########################################################


#!/bin/bash

function title ()
{
    echo -ne "\033]30;$1\007"
}

function ssh ()
{
    dest=${!#}
    if [[ $dest == *"@"* ]]; then
        USERNAME=`echo $dest | cut --only-delimited -d '@' -f1`
        SERVERNAME=`echo $dest | cut --only-delimited -d '@' -f2`
    else
        USERNAME=$USER
	SERVERNAME=$dest
    fi

	
    cp ~/.bashrc /tmp/.bashrc_remote
    echo "export PS1='\[\e[32m\]$USERNAME\[\e[00m\]@\[\e[91m\]$SERVERNAME\[\e[00m\]:\[\e[00m\]\w\[\e[00m\]> '" >> /tmp/.bashrc_remote
    scp -q /tmp/.bashrc_remote $USERNAME@$SERVERNAME:~/.bashrc_remote

    # check if the remote has tmux 
    if command ssh $@ "command -v tmux>/dev/null" 2>/dev/null; then 
        # just ssh into it
        command ssh -t $@ "/bin/bash --rcfile ~/.bashrc_remote; rm ~/.bashrc_remote"
    else 
    
        # no tmux on the remote => if current has tmux => change current tmux window title to the remote name
        if command -v tmux>/dev/null; then
            tmux set-window-option window-status-format "#[fg=green] #{window_index} #[fg=colour196] $SERVERNAME"
            tmux set-window-option window-status-current-format "#[fg=green] #{window_index} #[fg=colour196] $SERVERNAME"
        fi
        command ssh -t $@ "/bin/bash --rcfile ~/.bashrc_remote; rm ~/.bashrc_remote"
        if command -v tmux>/dev/null; then
            tmux set-window-option window-status-format "#[fg=green] #{window_index} #[fg=colour45] #{pane_current_path}"
            tmux set-window-option window-status-current-format "#[fg=green] #{window_index} #[fg=colour45] #{pane_current_path}"
        fi
    fi
}


function rpm-extract ()
{
    rpm2cpio $1 | cpio -idmv
}

git_n_files=0
git_commit=""
git_push=""

function git-init-vars ()
{
    git_n_files=0
    git_commit="git commit -m"
    git_push="git push"
}

function git-add-all ()
{
    if [ "$#" -lt 1 ] || [ "$#" -gt 2  ]; then
        echo "usage : git-commit-all [jira] \"commit message\""
        return
    elif [ "$#" -eq 1 ]; then
        jira=$(git st | awk '/On branch/ {print $3 }' | awk 'BEGIN {FS="-"}; {print ""$1"-"$2""}')
        message=$1
    else
        jira=$1
        message=$2
    fi

    git-init-vars
    
    files=$(git st | awk '/modified:|deleted:/ {print $3}')
    new_files=$(git st | awk '/new file:/ {print $4}')
    files="$files $new_files"
    git_n_files=$(echo $files| wc -l)
    if [ $git_n_files -eq 0 ]; then
        return
    fi
    
    git add --all $files
    git st
    git_commit="$git_commit \"$jira $message\""
    printf "\e[96m$git_commit\e[0m\n"    
}

function git-commit-all ()
{
    if [ "$#" -lt 1 ] || [ "$#" -gt 2  ]; then
        echo "usage : git-commit-all \"commit message\""
        return
    fi

    git-add-all "$@"
    if [ $git_n_files -eq 0 ]; then
        return
    fi
 
    echo "Commit using the above command? [Y/n]"
    read -s -n 1 answer 
    if [ -z "$answer" ] || [ $answer != 'n' ]; then
        eval $git_commit
        printf "\e[96m$git_push\e[0m\n"
    else
        git_n_files=0
    fi
}

function git-push-all ()
{
    if [ "$#" -lt 1 ] || [ "$#" -gt 2  ]; then
        echo "usage : git-push-all \"commit message\""
        return
    fi

    git-commit-all "$@"
    if [ $git_n_files -eq 0 ]; then
        return
    fi  

    echo "Push using the above command? [Y/n]"
    read -s -n 1 answer
    if [ -z "$answer" ] || [ $answer != 'n' ]; then
        eval $git_push 
    fi
}

function git-unstage-all ()
{
    git reset HEAD
    git st
}

function git-undo-commit ()
{
    git reset --soft HEAD~1
    git st
}

function path-munge ()
{
    export PATH=$1:$PATH
}

function show-colors ()
{
    for i in 00{2..8} {0{3,4,9},10}{0..7};
    do
        echo -e "$i \e[0;${i}mcolor\e[00m  \e[1;${i}mcolor\e[00m";
    done
}

function show-rich-colors ()
{
    for i in {0..255}; do
        printf "\x1b[0;38;5;${i}mcolour${i}\x1b[0m\n"
        printf "\x1b[1;38;5;${i}mcolour${i}\x1b[0m\n"
        printf "\x1b[2;38;5;${i}mcolour${i}\x1b[0m\n"
        printf "\x1b[3;38;5;${i}mcolour${i}\x1b[0m\n"
        printf "\x1b[4;38;5;${i}mcolour${i}\x1b[0m\n"
        printf "\x1b[5;38;5;${i}mcolour${i}\x1b[0m\n"
        printf "\x1b[6;38;5;${i}mcolour${i}\x1b[0m\n"
        printf "\x1b[7;38;5;${i}mcolour${i}\x1b[0m\n"
    done
}


# Searches for text in all files in the current folder
function ftext ()
{
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}

# Goes up a specified number of directories  (i.e. up 4)
function up ()
{
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++))
		do
			d=$d/..
		done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

#######################################################
# Run tmux if installed
#######################################################

if command -v tmux>/dev/null;
then
  # find detached session
  SESSION=$(tmux ls 2>/dev/null | grep -v attached | awk -F ':' '{print $1;}' | sort -n | tail -1)
  if [ ! -z "$SESSION" ]; then
    tmux_cmd="TERM=xterm-256color tmux attach -t \"$SESSION\""

  else
  # no detached sessions => make a new session
    MAX_SESSION=$(tmux ls 2>/dev/null | awk '{print $1;}' | sed -n 's/session// ; s/://p' | sort -n | tail -1)
    if [ ! -z "$MAX_SESSION" ]; then
      SESSION=$((MAX_SESSION+1))
    else
      SESSION=1
    fi
    tmux_cmd="TERM=xterm-256color tmux -q new -s session$SESSION"
  fi
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && eval $tmux_cmd
fi


# Enable default toolset
source /opt/rh/devtoolset-7/enable
source /opt/rh/llvm-toolset-7/enable


# Boost variables
export BOOST_ROOT=/home/sroot/Applications/boost_1_77_0

