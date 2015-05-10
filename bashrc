# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups:erasedups
export HISTIGNOE="df:ls:+:.."

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

HISTIGNORE='q:ls:..'

##############
### PROMPT ###
##############
source /home/uibxn/.bashrc.prompt
###############

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

###############
### ALIASES ###
###############
source /home/uibxn/.bashrc.aliases
###############

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
# sudo completion
complete -cf sudo
# disable Ctrl+S (XOFF) and Ctrl+Q (XON) flow control commands
stty -ixon

##### Export
# WTF is this crap?
PATH=/usr/local/bin:$PATH:/usr/share/java/apache-ant/bin:/opt/android-sdk/tools:/opt/java/jre/bin/:/home/uibxn/.Scripts/
PYTHONPATH=$PYTHONPATH:/usr/lib/python2.6/
JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH
export JAVA_HOME
export OOO_FORCE_DESKTOP=kde
export SVN_EDITOR="gvim"
export EDITOR="vim"
#####

export LESS_TERMCAP_mb=$'\E[01;31m' \
LESS_TERMCAP_md=$'\E[01;38;5;74m' \
LESS_TERMCAP_me=$'\E[0m' \
LESS_TERMCAP_se=$'\E[0m' \
LESS_TERMCAP_so=$'\E[38;5;246m' \
LESS_TERMCAP_ue=$'\E[0m' \
LESS_TERMCAP_us=$'\E[04;38;5;146m' \

