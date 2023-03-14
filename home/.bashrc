# This file is part of eRCaGuy_dotfiles: https://github.com/ElectricRCAircraftGuy/eRCaGuy_dotfiles

# INSTALLATION & USAGE INSTRUCTIONS:
# - If you are using my bash configuration files for yourself, the primary file you
#   should edit and customize is the ".bash_aliases_private" file, NOT the ".bashrc" file.
# - See the "eRCaGuy_dotfiles/home/README.md" file, with full instructions and details, here:
#   https://github.com/ElectricRCAircraftGuy/eRCaGuy_dotfiles/tree/master/home
#
# Option 1) (what you *may* want to use) if you think you will be editing your ~/.bashrc file
# directly, rather than the ~/.bash_aliases_private file like I recommend, then COPY this file
# to ~/.bashrc:
#   Option A) it doesn't exist in your home dir yet, so copy the whole thing over:
#           cp -i .bashrc ~
#   Option B) append the contents of this file to the end of your existing ~/.bashrc file:
#           cat .bashrc >> ~/.bashrc
# Option 2) (recommended, and what I do for most of my computers) if you plan to NOT edit your
# ~/.bashrc file directly, and instead edit only ~/.bash_aliases_private (like I do), then just
# SYMLINK this file from my repo into yoru home dir. This way you can pull my repo to always get
# the latest version of my ~/.bashrc file directly onto your computer too:
#       cd path/to/here
#       ln -si "${PWD}/.bashrc" ~


# ==================================================================================================
# START OF THE STANDARD UBUNTU-18-INSTALLED .bashrc FILE
# - some minor additions or changes from the original may exist, indicated by comments which
#   begin with "# GS"
# - Find a backup copy of Ubuntu's default ~/.bashrc file on Ubuntu in "/etc/skel/.bashrc".
#   See here: https://askubuntu.com/a/404428/327339
# vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias rgrep='rgrep --color=auto' # GS added
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# END OF THE STANDARD UBUNTU-18-INSTALLED .bashrc FILE
# - some minor additions or changes from the original may exist, indicated by comments which
#   begin with "# GS"
# ==================================================================================================

# Bash aliases and functions below will override any by the same name in both the ".bash_aliases"
# and ".bash_aliases_private" files. I recommend you edit the ".bash_aliases_private" file instead.
# See the "eRCaGuy_dotfiles/home/README.md" file, with full instructions, here:
# https://github.com/ElectricRCAircraftGuy/eRCaGuy_dotfiles/tree/master/home

# GS: Automatically added by the `fzf` installer, which was run with these installation commands
# from here: https://github.com/junegunn/fzf#using-git
#
#       git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#       ~/.fzf/install
#
# For more info. on the `fzf` fuzzy-finder, see the official repo here:
# https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
