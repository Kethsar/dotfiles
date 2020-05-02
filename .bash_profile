# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

export GOPATH="$HOME/documents/dev/go"

if [ -d "$HOME/bin" ] ; then
	PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.local/bin" ] ; then
	PATH="$PATH:$HOME/.local/bin"
fi

if [ -d "$HOME/.gem/ruby/2.3.0/bin" ] ; then
	PATH="$PATH:$HOME/.gem/ruby/2.3.0/bin"
fi

if [ -d "$GOPATH/bin" ] ; then
	PATH="$PATH:$GOPATH/bin"
fi

