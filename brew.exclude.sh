#!/usr/bin/env bash

PROMPT='[ HOMEBREW ]'

echop () {
  echo "$PROMPT $@"
}

install_brew() {
  echop "Install Homebrew"
  echop "Proceed? (y/n)"
  read resp
  if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    which brew 1>&/dev/null
    if [ ! "$?" -eq 0 ] ; then
      echop "Homebrew not installed. Attempting to install..."
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

      if [ ! "$?" -eq 0 ] ; then
	echop "Something went wrong. Exiting..." && exit 1
      fi
    fi
  else
    echop "Cancelled Homebrew installation..."
  fi
}

install_libraries() {
  echop "Install Homebrew libraries"
  echop "Proceed? (y/n)"
  read resp
  if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    which brew 1>&/dev/null
    if [ ! "$?" -eq 0 ] ; then
      echop "Homebrew not installed. Run install first..."
    else
      echop "Installing Homebrew libraries..."
      brew update
      brew upgrade
      brew install coreutils
      brew install python
      brew install tmux
      brew install neovim
      brew install ack
      brew install the_silver_searcher
      echop "Done!"
    fi
  else
    echop "Cancelled Homebrew libraries installation..."
  fi
}

if [ $( echo "$OSTYPE" | grep 'darwin' ) ] ; then
  echop "Detected macOS"
  install_brew
  install_libraries
else
  echop "MacOS was not detected, skipping..."
fi


