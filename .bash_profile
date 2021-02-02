# home-brew says to have /usr/local/bin before /usr/bin.
export PATH=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin:/usr/local/share/npm/bin:/usr/local/sbin

# command line prompt
export PS1='\h:\W\[\033[35m\]$(__git_branch__)\[\033[0m\]$ '

export CDPATH=.:/Users/ningja/dev/projects:/Users/ningja/dev/projects/fromatob:/Users/ningja/dev/projects/tcp:..:/Users/ningja/
export EDITOR='mvim'
export GIT_EDITOR='mvim -f -c "au VimLeave * opendiff -a Terminal"'
export NODE_PATH="/usr/local/lib/node"
export SHELL=/bin/bash

# git dirty.
function __git_dirty_indicator__ {
  git status 2> /dev/null | tail -n1 | grep -q "working tree clean" || echo "*"
}

# git branch.
function __git_branch__ {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \1$(__git_dirty_indicator__)/"
}

alias b='bundle'
alias bc='bundle console'
alias be='bundle exec'
alias bo='bundle open'
alias cdg='cd $GEM_HOME/gems'
alias g="hub"
alias gclean='git checkout master && git branch --merged | grep -v master | xargs git branch -d'
alias h="heroku"
alias jw="jasmine-headless-webkit"
alias ls="ls -al"
alias o="open"
alias v="mvim"
# Run run last command after clearing screen (like cmd-k).
alias re='clear; printf "\033[3J"; echo $(fc -ln -1); "$SHELL" -c "$(history -p !!)"'
# Don't count "re" as history so it can be run multiple times in a row.
export HISTIGNORE='re'

# Bundler "shims" (isn't that what they're called?)
alias guard="bundle exec guard"
alias rails="bin/rails"
alias rake="bundle exec rake"
alias rspec="bundle exec rspec"
alias sq="cd ~/dev/projects/fromatob/skynet && bundle exec service_quickies"

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby 2.7.0

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
