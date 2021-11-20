export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:/Applications/MacVim.app/Contents/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export EDITOR='mvim'
export GIT_EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'

# Command line prompt.
setopt PROMPT_SUBST
autoload -U colors && colors
export PROMPT='%{$fg_bold[white]%}%m %{$fg[yellow]%}%1~%{$fg_bold[magenta]%}$(__git_branch__)%{$reset_color%}$ '

# git dirty.
function __git_dirty_indicator__ {
  git status 2> /dev/null | tail -n1 | grep -q "working tree clean" || echo "*"
}

# git branch.
function __git_branch__ {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \1$(__git_dirty_indicator__)/"
}

# Turn on autocomplete.
autoload -Uz compinit && compinit

cdpath=($HOME $HOME/dev/projects $HOME/dev/projects/tcp ..)

# Word breaks.
autoload -U select-word-style
select-word-style bash

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
alias rails="bin/rails"

# chruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby 3.0.2
