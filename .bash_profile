#path
PATH=/usr/local/bin/:$PATH 
PATH=$PATH:/Users/ty/.local/bin/
PATH=$PATH:./node_modules/.bin/
PATH=$PATH:activator-dist/bin/
PATH=$PATH:sqlite/
PATH=$PATH:$HOME/.bin
PATH=$PATH:$HOME/.cargo/bin
export PATH
#dot files
cp ~/Workspace/dot-files/.vimrc ~/.vimrc
cp ~/Workspace/dot-files/.ideavimrc ~/.ideavimrc
#http://osxdaily.com/2013/02/05/improve-terminal-appearance-mac-os-x/
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[36m\]\u \w\[\033[34m\]\[\033[32m\]:\[\033[33m\]\$(parse_git_branch)\[\033[m\]\$"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export VISUAL=vim
export EDITOR=$VISUAL
export MAVEN_OPTS="-Xmx2g -XX:ReservedCodeCacheSize=512m"

pushd () {
  command pushd "$@" > /dev/null
}

popd () {
  command popd "$@" > /dev/null
}

alias grep='echo use-rg!'
alias ls='ls -GFh'
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
alias cd='pushd'
alias popd='popd'
fortune | cowsay
#set up iterm theme here:  http://iterm2colorschemes.com  use itermcolors file extension.
