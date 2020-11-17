if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
docker-clean() {
  docker rm $(docker ps -a -q); docker rmi $(docker images | grep "^<none>" | awk '{print $3}');
}

# find files with case-insensetive matching in current directory
function findhere() {
	find . -iname "*$1*"
}

# do a case-insensetive grep on all the files in a directory
function grip() {
	grep -ir "$1" .
}

# Colorize grep matches
# test if color is supported
echo | grep --color=auto > /dev/null 2>&1
# if it is, always add color
if [[ $? == 0 ]]; then
	alias grep="grep --color=auto"
	alias fgrep="fgrep --color=auto"
	alias egrep="egrep --color=auto"
fi

# Nicely formatted terminal prompt
export PS1='\n\[$bold\]\[$black\][\[$dk_blue\]\@\[$black\]]-[\[$green\]\u\[$black\]]-[\[$pink\]\w\[$black\]]\[\033[0;33m\] \[\033[00m\]\[$reset\]\n\[$reset\]\$ '

export PATH=/usr/local/bin:/bin:/sbin:/usr/local/sbin:/usr/bin:/Users/bmax/Library/Python/3.6/bin:/Users/bmax/Library/Python/2.7/bin:$PATH

alias git=lab

# docker-machine
if which docker-machine > /dev/null; then
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.105:2376"
export DOCKER_CERT_PATH="/Users/bmax/.docker/machine/machines/dev"
export DOCKER_MACHINE_NAME="dev"
fi

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias -- -="cd -"

# Shortcuts

# useful shortcuts
alias h="history"
alias f="findhere"
alias o="open"
alias oo="open ."
alias phpunit="./vendor/bin/phpunit"
alias psysh="~/./psysh"

# common folder shortcuts
alias p="cd '${PROJECT_DIR-$HOME}"

# Interactive rm, cp, and mv
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Colorize grep matches
# test if color is supported
echo | grep --color=auto > /dev/null 2>&1
# if it is, always add color
if [[ $? == 0 ]]; then
	alias grep="grep --color=auto"
	alias fgrep="fgrep --color=auto"
	alias egrep="egrep --color=auto"
fi

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then
	# GNU ls
	LS_COLOR_FLAG="--color=auto"
else
	# darwin ls
	LS_COLOR_FLAG="-G"
fi
# Specialized directory listings
alias la="ls -lA ${LS_COLOR_FLAG}"
alias ll="ls -l ${LS_COLOR_FLAG}"
alias l.="ls -d ${LS_COLOR_FLAG} .*"
alias ls="ls ${LS_COLOR_FLAG}"
alias lf="ls -l ${LS_COLOR_FLAG} | grep '^d'"
alias f="findhere"

# docker aliases
alias dc="docker-compose"
alias dm="docker-machine"
alias dps="docker ps"
dockerssh() {
 docker exec -it $1 sh 
}
alias dssh=dockerssh

# git aliases
alias gs="git status"
alias gpr="git pull-request"
alias gpo="git push origin head"
alias gpull="git pull upstream master"
alias gpof="git push origin head --force"
alias grebase="git fetch origin master && git pull --rebase origin master"
alias gcom="git checkout master"
alias gproon="git branch --merged | grep -v '*' | xargs -n 1 git branch -d"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gca="git commit -a --amend"

# check if we can display in long format
if ls --format=long > /dev/null 2>&1; then
	alias dir="ls ${LS_COLOR_FLAG} --format=vertical"
	alias vdir="ls ${LS_COLOR_FLAG} --format=long"
fi

unset LS_COLOR_FLAG

export NVM_DIR="/Users/bmax/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export COMPOSER_ALLOW_XDEBUG=1

alias enenv="source ~/.virtualenvs/\${PWD##*/}/bin/activate"

# Added by GraphLab Create Launcher v3.0.1
export PATH="/Users/bmax/anaconda/bin:$PATH"export PATH="/usr/local/opt/php@7.1/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PROJECT_HOME=~/src

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
eval "$(rbenv init -)"
