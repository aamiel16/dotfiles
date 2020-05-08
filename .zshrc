#
# ─── ZSH CONFIG ──────────────────────────────────────────────────────────────────────
#

autoload -U promptinit; promptinit
prompt pure
plugins=( 																	  # plugins
	git aws docker docker-compose
)
bindkey -v																	 	# vim
ulimit -n 2048 															 	# os limits
export LC_ALL=en_US.UTF-8  										# locale
export CLICOLOR=1 				 										# colors
export TERM=xterm-256color										# set colors to match iTerm2 Terminal Colors

source /Users/adrian/.oh-my-zsh/oh-my-zsh.sh  # zsh

#
# ─── PATHS ───────────────────────────────────────────────────────────────────────────
#

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home

# Elastic Beanstalk
export PATH=$PATH:/Users/adrian/.ebcli-virtual-env/executables

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

# Yarn
export PATH=$PATH:$HOME/.yarn/bin
export PATH=$PATH:$HOME/.config/yarn/global/node_modules/.bin
export YVM_DIR=/usr/local/opt/yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Bin
export PATH=$PATH:/usr/local/bin

#
# ─── SOURCE ──────────────────────────────────────────────────────────────────────────
#

[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.zshenv ] && source ~/.zshenv
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
