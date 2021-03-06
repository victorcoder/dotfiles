#!/bin/bash

if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

# Set my editor and git editor
export EDITOR=vim
export GIT_EDITOR=vim

# Don't check mail when opening terminal.
unset MAILCHECK

source ~/.dotfiles/prompt

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export TERM=screen-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Custom PATHS
export PATH="~/bin:/usr/local/bin:/usr/local/sbin:./bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

export GOROOT="/usr/local/opt/go/libexec"
export PATH="$GOROOT/bin:$PATH"
export GOPATH="$HOME"
export PATH="$GOPATH/bin:$PATH"

if [ -d "/Applications/Postgres.app" ]; then
  export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
fi

# Set your credentials in this file
if [ -f "$HOME/.auth" ]; then
  source $HOME/.auth
fi

export AWS_DEFAULT_REGION=eu-west-1
export EC2_REGION=$AWS_DEFAULT_REGION

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -e "/usr/local/bin/direnv" ]; then
  eval "$(direnv hook bash)"
fi

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#gpg-agent Pretty good changelog https://www.gnupg.org/faq/whats-new-in-2.1.html
#This step is not necesary, but due to the outdated state of gpg libs in vautl-tec, we need to be sure that the agent is running
eval `gpg-agent --daemon 2>/dev/null`
# SSH_AUTH_SOCK is autoexported in the previous eval (if enable-ssh-support option is present)
export GPG_AGENT_INFO=${HOME}/.gnupg/S.gpg-agent:66568:1
export GPG_TTY=$(tty)

if [ -d "$HOME/src/github.com/jobandtalent/system/script" ]; then
  export PATH="$HOME/src/github.com/jobandtalent/system/script:$PATH"
fi

if [ -d "/Applications/Visual Studio Code.app" ]; then
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

#export PATH="$PATH:~/Library/Python/2.7/bin"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
