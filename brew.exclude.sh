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
      brew install jq
      brew install minikube
      brew install helm
      brew cask install java
      brew cask install skype
      brew cask install google-chrome
      brew cask install docker
      brew cask install iglance
      brew tap aws/tap
      brew install aws-sam-cli
      echop "Done!"
    fi
  else
    echop "Cancelled Homebrew libraries installation..."
  fi
}

install_customizations() {
  echop "Install MacOS customizations"
  echop "Proceed? (y/n)"
  read resp
  if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    sh .macos
    echop "Done!"
  else
    echop "Cancelled MacOS customizations installation..."
  fi
}

if [ $( echo "$OSTYPE" | grep 'darwin' ) ] ; then
  echop "Detected macOS"
  install_brew
  install_libraries
else
  echop "MacOS was not detected, skipping..."
fi


