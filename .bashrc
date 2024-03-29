# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

color_prompt=yes
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -GF --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ls='ls -FG'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias rm='rm -i'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

bind '"\e[A"':history-search-backward # Use up and down arrow to search
bind '"\e[B"':history-search-forward  # the history. Invaluable!

#export LSCOLORS="ExGxCxDxBxEgEdxbxgxcxd"
export LSCOLORS="ExGxFxdxCxDxDxBxBxExEx"

export PKG_CONFIG_PATH=/usr/local/libdata/pkgconfig

export PAGER="less"
#export PAGER="/usr/local/bin/most"

#man() {
#	env LESS_TERMCAP_mb=$'\E[01;31m' \
#	LESS_TERMCAP_md=$'\E[01;38;5;74m' \
#	LESS_TERMCAP_me=$'\E[0m' \
#	LESS_TERMCAP_se=$'\E[0m' \
#	LESS_TERMCAP_so=$'\E[38;5;246m' \
#	LESS_TERMCAP_ue=$'\E[0m' \
#	LESS_TERMCAP_us=$'\E[01;32;146m' \
#	man "$@"
#}


#export LESS_TERMCAP_mb=$'\E[0;103m' # begin blinking
#export LESS_TERMCAP_md=$'\E[0;93m' # begin bold
#export LESS_TERMCAP_me=$'\E[0m' # end mode
#export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
#export LESS_TERMCAP_so=$(tput bold; tput setaf 8; tput setab 3) # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m' # end underline
#export LESS_TERMCAP_us=$'\E[04;32m' # begin underline
#export LESS_TERMCAP_mr=$(tput rev)
#export LESS_TERMCAP_mh=$(tput dim)
#export LESS_TERMCAP_ZN=$(tput ssubm)
#export LESS_TERMCAP_ZV=$(tput rsubm)
#export LESS_TERMCAP_ZO=$(tput ssupm)
#export LESS_TERMCAP_ZW=$(tput rsupm)


# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\e[01;31m'			# begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'	# begin bold
export LESS_TERMCAP_me=$'\e[0m'				# end mode
export LESS_TERMCAP_se=$'\e[0m'				# end standout-mode
#export LESS_TERMCAP_so=$'\e[38;5;246m'		# begin standout-mode - info box
export LESS_TERMCAP_so=$'\e[0;30;103m'		# bg yellow, searching
export LESS_TERMCAP_ue=$'\e[0m'				# end underline
#export LESS_TERMCAP_us=$'\e[04;38;5;146m'	# begin underline
export LESS_TERMCAP_us=$'\e[38;5;209m'		# fg orange

export PROMPT_COMMAND=                                 # stop GNU-screen auto-title
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
