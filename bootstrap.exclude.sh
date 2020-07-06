#!/bin/bash

PROMPT='[ BOOTSTRAP ]'

source .exports.exclude

echop () {
  echo "$PROMPT $@"
}


init () {
  echo "\n--- DIRECTORIES ---"
  echop "Making a Projects folder in $PATH_TO_PROJECTS if it doesn't already exist"
  mkdir -p "$PATH_TO_PROJECTS"
  echop "Making a Playground folder in $PATH_TO_PLAYGROUND if it doesn't already exist"
  mkdir -p "$PATH_TO_PLAYGROUND"
}

link () {
  echo "\n--- SYMLINKS ---"
  echop "This utility will symlink the files in this repo to the home directory"
  echop "Proceed? (y/n)"
  read resp
  if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore$|.*.md' ) ; do
      ln -sv "$PWD/$file" "$HOME"
    done
    echo "$PROMPT Symlinking complete"
  else
    echo "$PROMPT Symlinking cancelled by user"
    return 1
  fi
}

bootstrap_homebrew () {
  echo "\n--- HOMEBREW ---"
  sh brew.exclude.sh
}

bootstrap_vim() {
  echo "\n--- NEOVIM ---"
  sh nvim.exclude.sh
}

bootstrap_nvm() {
  echo "\n--- NODE VERSION MANAGER ---"
  sh nvm.exclude.sh
}

bootstrap_prezto() {
  echo "\n--- PREZTO ---"
  sh prezto.exclude.sh
}

bootstrap_cli() {
  echo "\n--- CLI TOOLS ---"
  sh cli.exclude.sh
}

init
link
bootstrap_homebrew
bootstrap_prezto
bootstrap_nvm
bootstrap_vim
bootstrap_cli
