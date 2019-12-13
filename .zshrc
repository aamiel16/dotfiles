autoload -U promptinit; promptinit
prompt pure

##
## ─── PATHS ───────────────────────────────────────────────────────────────────────────
##

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home

# Kafka
export CONFLUENT_HOME=$HOME/Library/Confluent
export PATH=$PATH:$CONFLUENT_HOME/bin
export PATH=$PATH:$CONFLUENT_HOME/confluent-hub/bin

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Openssl
export CPPFLAGS=-I/usr/local/opt/openssl/include
export LDFLAGS=-L/usr/local/opt/openssl/lib
export PATH=$PATH:/usr/local/opt/openssl/bin

# Yarn
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

# Python
export PATH=$PATH:/Users/adrian/Library/Python/3.7/bin

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# oh-my-zsh
export ZSH=/Users/adrian/.oh-my-zsh

# NVIM
export PLUG=/Users/adrian/.local/share/nvim/plugged
export LC_ALL=en_US.UTF-8

# Bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/bin

# Colors
 # Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color


##
## ─── MISC CONFIGS ────────────────────────────────────────────────────────────────────
##

# Vim
bindkey -v

# Completion
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit && compinit -i # Docker completion

# OS limits
ulimit -n 2048

# Theme
# ZSH_THEME="pure"

# Plugins
plugins=(
	git
)


##
## ─── SOURCING ────────────────────────────────────────────────────────────────────────
##

# Aliases
source ~/.aliases
source ~/.zshenv

# zsh
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export YVM_DIR=/usr/local/opt/yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
