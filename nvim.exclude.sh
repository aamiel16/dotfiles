#!/usr/bin/env bash

PROMPT='[ neovim ]'

echo_with_prompt () {
  echo "$PROMPT $@"
}

echo_with_prompt "Initializing neovim directory"
mkdir -p "$PATH_TO_NVIM"
cp -r ./nvim.exclude/. $PATH_TO_NVIM

echo_with_prompt "Done!"
