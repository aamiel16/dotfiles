#!/bin/bash

PROMPT='[ PREZTO ]'

echop () {
  echo "$PROMPT $@"
}

echop "Bootstrap prezto"
echop "Proceed? (y/n)"
read resp
if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
  echop "Installing prezto..."
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  echop "Done!"
else
  echop "Cancelled prezto bootstrap..."
fi
