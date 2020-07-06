#!/usr/bin/env bash

PROMPT='[ NEOVIM ]'

echop () {
  echo "$PROMPT $@"
}

echop "Bootstrap neovim"
echop "Proceed? (y/n)"
read resp
if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
  echop "Initializing neovim..."
  export PATH_TO_NVIM="$HOME/.config/nvim"
  export NVIM_REPO_PATH="$PWD/nvim.exclude"
  mkdir -p "$PATH_TO_NVIM"
  for file in $(ls -A $NVIM_REPO_PATH | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md' ) ; do
    ln -sv "$NVIM_REPO_PATH/$file" "$PATH_TO_NVIM"
  done

  echop "Initializing tmux..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  echop "Done!"
else
  echop "Cancelled neovim bootstrap..."
fi

