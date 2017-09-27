if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
export JAVA_HOME=$(/usr/libexec/java_home)


parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# PS1='\[\033[0;36m\]\u:\w\$ \[\033[0m\]'
export PS1="\u@\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "
export PATH="/usr/local/opt/curl/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

label()
{
if [ "$1" = "" ]; then
echo "Usage: label <ident>"
else
pwd >$HOME/..$1
fi
}

jump() { 
    if [ "$1" = "" ]; then
        echo "Usage: jump <ident>"
    elif [ ! -e $HOME/..$1 ]; then
        echo "error: no such label $1"
    elif [ ! -d `cat $HOME/..$1` ]; then
        echo "error: label $1 points to non-existing directory `cat $HOME/..$1`"
    else
        cd `cat $HOME/..$1`
    fi
}
alias g="jump"
alias l="ls -l"
alias p="cd .."


labels() { (cd $HOME; grep "." ..?* /dev/null)
}



