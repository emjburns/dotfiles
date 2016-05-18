export JAVA_HOME=$(/usr/libexec/java_home)
export CATALINA_HOME=/usr/local/Cellar/tomcat/8.0.32/libexec/
#export PATH="/usr/local/Cellar/tomcat/8.0.32/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi


PS1='\[\033[0;36m\]\u:\w\$ \[\033[0m\]'

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



