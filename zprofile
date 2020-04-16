# ALIASES
alias ls='ls -F'
alias ll='ls -lah'
alias cp='cp -iv'
alias rm='rm -i'
alias mv='mv -iv'

alias gitba='git branch -a'

alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# FUNCTIONS
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

git_branches_clean(){
    git fetch --prune && git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
}