function bslcb {
	RETVL=$?
	[ -n "$BSLNFC" ] &&
	{
		BSLMT="$(
			history 1 |
			sed 's/^ *//;s/ /]/'
		) [$RETVL]"
	} ||
	BSLMT=']'
	BSLMT="bash.$(whoami) [$$-$BSLMT"
	
	# pick your poison
	#logger -p local6.debug "$BSLMT"
	IFS='' echo "$BSLMT" >> ~/.bash_flog

	BSLNFC=asdf
}
PROMPT_COMMAND=bslcb

HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=10000

shopt -s histappend
shopt -s checkwinsize

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias tmux='TERM=screen-256color tmux'

PS1="\n\
\[\033[1;30m\]-\
\[\033[1;35m\]\$?\
\[\033[1;30m\]-\
\[\033[1;31m\]\$(date +%H%M%S)\
\[\033[1;30m\]-\
\[\033[1;33m\]\u\
\[\033[1;30m\]-\
\[\033[1;32m\]\h\
\[\033[1;30m\] <\
\[\033[1;34m\]\w\
\[\033[1;30m\]> \
\[\033[0m\]\n"

alias q='kill -9 $$'
alias a='tmux attach || tmux'
alias lg='looking-glass-client'
alias wine='WINEPREFIX=~/opt/wine_f2k wine'
alias ytdl='youtube-dl -f bestvideo[ext=webm]+251/bestvideo[ext=mp4]+(258/256/140)/bestvideo[ext=webm]+(250/249)/best'
alias dmesg='dmesg -e'
alias ltspice='wine ~/opt/wine_f2k/drive_c/ltspice/LTSpice.exe'
alias tjail='ssh -p 573 root@192.168.1.2'
alias dots='/usr/bin/git --git-dir=/home/kethsar/.config/dotgit --work-tree=/home/kethsar'
