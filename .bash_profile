# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

export GOPATH="$HOME/documents/dev/go"
export CARGO_HOME="$HOME/documents/dev/rust"
export CARGO_TARGET_DIR="/mnt/data/cache/rust"

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

if [ -d "$CARGO_HOME/bin" ] ; then
	PATH="$PATH:$CARGO_HOME/bin"
fi

# Qt 5.14 or 5.15 fucked things up hard
# Requires setting this for shit to display properly
export QT_FONT_DPI=96

export WINEPREFIX="$HOME/opt/wine_f2k"
export EDITOR="/usr/bin/vim"
