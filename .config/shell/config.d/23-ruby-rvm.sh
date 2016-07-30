#!/usr/bin/env bash
## ek9/shell-config - https://github.com/ek9/shell-config
## 23-ruby-rvm.sh
## source RVM if it is installed

if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
    rvm() {
        command -v foo >/dev/null 2>&1 || source "$HOME/.rvm/scripts/rvm"
        exec rvm "$@"
    }
elif command -v gem >/dev/null; then

    # apppend user's gems to PATH if directory exists and it is not yet in PATH
    GEMBIN="$(ruby -e 'print Gem.user_dir')/bin"
    if [[ $UID -ge 1000 && -d $GEMBIN && -z $(echo $PATH | grep -o $GEMBIN) ]]
    then
        export PATH=$PATH:$GEMBIN
        export GEM_HOME=$GEMBIN
    fi
fi

