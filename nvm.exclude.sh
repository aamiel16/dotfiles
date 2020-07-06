#!/usr/bin/env bash

PROMPT='[ NODE VERSION MANAGER ]'

echop () {
  echo "$PROMPT $@"
}

echop "Bootstrap Node Version Manager (NVM)"
echop "Proceed? (y/n)"
read resp
if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
  echop "Checking if NVM is already installed..."
  if ! [ which nvm &> /dev/null ] ; then
    echop "NVM already installed..."
  else
    echop "NVM not installed. Attempting to install..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
    echop "Installing latest LTS node verion..."
    . $NVM_DIR/nvm.sh
    nvm install --lts
    echop "Done!"
  fi
else
  echop "Cancelled NVM Bootstrap..."
fi
