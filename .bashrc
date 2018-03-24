##=============================================================================
##	.bashrc
##	Tomoaki Takauchi
##=============================================================================

#echo 'read .bashrc'

## Umask
# 新しく作られたファイルのパーミッションがつねに644になるようにする
umask 022

## coreファイルを作らせないようにする
ulimit -c 0
## coreファイルを作る
#ulimit -c unlimited


# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return


##-----------------------------------------------------------------------------
## Enviromental Variables
##-----------------------------------------------------------------------------
#unset LANG

# less関連
export PAGER=less
export LESS='-X -i -R -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'    #
export LESSOPEN="| /usr/bin/lesspipe.sh '%s'"                               #
export LESSCLOSE="/usr/bin/lesspipe.sh '%s' '%s'"                           #
export JLESSCHARSET=japanese-ujis                                           #


##-----------------------------------------------------------------------------
## Shell Options
##-----------------------------------------------------------------------------
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

##-----------------------------------------------------------------------------
## Completion options
##-----------------------------------------------------------------------------
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

##-----------------------------------------------------------------------------
## History Options
##-----------------------------------------------------------------------------
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

##-----------------------------------------------------------------------------
## Aliases
##-----------------------------------------------------------------------------
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Interactive operation...
 alias rm='rm -i'
 alias cp='cp -i'
 alias mv='mv -i'
# Default to human readable figures
 alias df='df -h'
 alias du='du -h'
# Misc :)
 alias less='less -r'                          # raw control characters
 alias whence='type -a'                        # where, of a sort
 alias grep='grep --color'                     # show differences in colour
 alias egrep='egrep --color=auto'              # show differences in colour
 alias fgrep='fgrep --color=auto'              # show differences in colour
# Some shortcuts for different directory listings
 alias ls='ls -hF --color=tty'                 # classify files in colour
 alias dir='ls --color=auto --format=vertical'
 alias vdir='ls --color=auto --format=long'
 alias ll='ls -la'                             # long list
 alias la='ls -A'                              # all but . and ..
 alias l='ls -CF'                              #

 alias vi=vim
# alias python=python3

##-----------------------------------------------------------------------------
## Functions
##-----------------------------------------------------------------------------
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func


##-----------------------------------------------------------------------------
# cygwin用
# Windowsコマンドの文字化け対策
##-----------------------------------------------------------------------------
function wincmd() {
  CMD=$1
  shift
  $CMD $* 2>&1 | iconv -f cp932 -t utf-8
}
           
alias ipconfig='wincmd ipconfig'
alias netstat='wincmd netstat'
alias netsh='wincmd netsh'
alias cscript='wincmd cscript'
alias ping='wincmd ping'


##-----------------------------------------------------------------------------
## Prompt
##-----------------------------------------------------------------------------
#default
#\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$
PS1="\[\e[1;35m\][$OSTYPE] \[\e[1;36m\]\u\[\e[1;32m\]@\h \[\e[33m\][\w] \[\e[0m\] \n\$\[\e[m\] "


##-----------------------------------------------------------------------------
## Others
##-----------------------------------------------------------------------------
# bashrc はすべてのホストで共有しているが、
# ホストごとに異なる設定は .bashrc_local という
# ファイルに入れてある。おもに研究用データのパス名などを設定。
if [ -f ~/.bashrc_local ]; then
	. ~/.bashrc_local
fi

#格言
if [ -f /usr/bin/fortune ]; then
  /usr/bin/fortune
fi
