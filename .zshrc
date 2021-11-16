export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:/Applications/MacVim.app/Contents/bin:$PATH"
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Command line prompt.
# export PS1='\h:\W\[\033[35m\]$(__git_branch__)\[\033[0m\]$ '

# git dirty.
function __git_dirty_indicator__ {
  git status 2> /dev/null | tail -n1 | grep -q "working tree clean" || echo "*"
}

setopt auto_cd
cdpath=($HOME $HOME/dev/projects $HOME/dev/projects/tcp)

# git branch.
function __git_branch__ {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \1$(__git_dirty_indicator__)/"
}

alias b='bundle'
alias bc='bundle console'
alias be='bundle exec'
alias bo='bundle open'
alias g="hub"
alias h="heroku"
alias ls="ls -al"
alias o="open"
# Run run last command after clearing screen (like cmd-k).
alias re='clear; printf "\033[3J"; echo $(fc -ln -1); "$SHELL" -c "$(history -p !!)"'
alias v="mvim"
alias rails="bundle exec rails"

# chruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby 3.0.2
