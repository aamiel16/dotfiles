#!/usr/bin/env bash

PROMPT='[ CLI ]'

echop () {
  echo "$PROMPT $@"
}

install_node() {
  echop "Install Node libraries"
  echop "Proceed? (y/n)"
  read resp
  if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    if [ which npm &> /dev/null ] ; then
      echop "Node not installed. Run install first..."
    else
      echop "Installing Node libraries..."
      npm install -g serverless
      npm install -g aws-cdk
      npm install -g neovim
      echop "Done!"
    fi
  else
    echop "Cancelled Node libraries installation..."
  fi
}

install_python() {
  echop "Install Python libraries"
  echop "Proceed? (y/n)"
  read resp
  if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    if [ which pip3 &> /dev/null ] ; then
      echop "Python not installed. Run install first..."
    else
      echop "Installing Python libraries..."
      pip3 install pynvim
      pip3 install localstack
      echop "Done!"
    fi
  else
    echop "Cancelled Node libraries installation..."
  fi
}

install_aws() {
  echop "Install AWS CLI"
  echop "Proceed? (y/n)"
  read resp
  if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    if [ which aws &> /dev/null ] ; then
      echop "AWS CLI already installed, skipping..."
    else
      echop "Installing AWS CLI..."
      curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
      sudo installer -pkg AWSCLIV2.pkg -target /
      rm -rf ./AWSCLIV2.pkg
      echop "Done!"
    fi
  else
    echop "Cancelled AWS CLI installation..."
  fi
}

install_node
install_python
install_aws
