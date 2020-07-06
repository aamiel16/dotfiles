#!/bin/bash

PROMPT='[ prezto ]'

echo_with_prompt () {
  echo "$PROMPT $@"
}

echo_with_prompt "Initializing prezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
