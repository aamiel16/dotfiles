#!/bin/bash

PROMPT='[ bootstrap ]'
source .exports.exclude

init () {
  echo "$PROMPT Making a Workspace folder in $PATH_TO_PROJECTS if it doesn't already exist"
  mkdir -p "$PATH_TO_WORKSPACE"
  echo "$PROMPT Making a Projects folder in $PATH_TO_PROJECTS if it doesn't already exist"
  mkdir -p "$PATH_TO_PROJECTS"
  echo "$PROMPT Making a Playground folder in $PATH_TO_PLAYGROUND if it doesn't already exist"
  mkdir -p "$PATH_TO_PLAYGROUND"
}

link () {
  echo "$PROMPT This utility will symlink the files in this repo to the home directory"
  echo "$PROMPT Proceed? (y/n)"
  read resp
  if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md' ) ; do
      ln -sv "$PWD/$file" "$HOME"
    done
    echo "$PROMPT Symlinking complete"
  else
    echo "$PROMPT Symlinking cancelled by user"
    return 1
  fi
}

install_tools () {
  if [ $( echo "$OSTYPE" | grep 'darwin' ) ] ; then
    echo "$PROMPT Detected macOS"
    echo "$PROMPT This utility will install useful tool utilities"
    echo "$PROMPT Proceed? (y/n)"
    read resp
    if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
      echo "$PROMPT Installing useful stuff using brew. This may take a while..."
      sh brew.exclude.sh
    else
      echo "$PROMPT Tool installation cancelled by user"
    fi
  else
    echo "$PROMPT Skipping tool installations because MacOS was not detected..."
  fi
}

bootstrap_vim() {
  ./nvim.exclude.sh
}

bootstrap_nvm() {
  ./nvm.exclude.sh
}

bootstrap_prezto() {
  ./prezto.exclude.sh
}

init
link
install_tools
bootstrap_prezto
bootstrap_vim
bootstrap_nvm
