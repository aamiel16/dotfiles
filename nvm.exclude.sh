#!/usr/bin/env bash

PROMPT='[ nvm ]'

echo_with_prompt () {
  echo "$PROMPT $@"
}

echo_with_prompt "Initializing Node Version Manager"
# Install nvm if it is not installed
which nvm 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
	echo "Node Version Manager (NVM) not installed. Attempting to install NVM"
	/usr/bin/ruby -e "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh)"
	if [ ! "$?" -eq 0 ] ; then
		echo "Something went wrong. Exiting..." && exit 1
	fi
fi
