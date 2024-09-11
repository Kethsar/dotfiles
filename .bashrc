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
		BSLMT="$(date +%s) bash.$(whoami) [$$-$BSLMT"
	
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
alias lg='looking-glass-client'
alias dmesg='dmesg -e'
alias ltspice='wine ~/opt/wine_f2k/drive_c/ltspice/LTSpice.exe'
alias tjail='ssh root@192.168.1.2'
alias dots='/usr/bin/git --git-dir=/home/kethsar/.config/dotgit --work-tree=/home/kethsar'
alias anki='QTWEBENGINE_CHROMIUM_FLAGS="--no-sandbox" /home/kethsar/opt/anki/bin/anki'
alias icecast='sudo icecast -c /etc/icecast2/icecast.xml'
alias proton='STEAM_COMPAT_DATA_PATH="$HOME/opt/geimu/.proton_compat" "$HOME/.steam/root/steamapps/common/Proton 5.13/proton"'

. /etc/bash.bashrc.tmux


export CARGO_HOME="$HOME/documents/dev/rust"
export CARGO_TARGET_DIR="/mnt/data/cache/rust"
export LESSSECURE="1"
