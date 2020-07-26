#zmodload zsh/zprof # profiler

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize locale, color
export TERM=xterm-256color

#
# Setup PATH
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

# Bin
export PATH=$PATH:/usr/local/bin

# Lazy load nvm
declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")
NODE_GLOBALS+=("nvim")

load_nvm () {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

for cmd in "${NODE_GLOBALS[@]}"; do
  eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done

#
# Completion
#
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

#
# Source aliases
#
[[ ! -f ~/.aliases ]] || source ~/.aliases

#zprof
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

[[ -s "/Users/adrian/.gvm/scripts/gvm" ]] && source "/Users/adrian/.gvm/scripts/gvm"
