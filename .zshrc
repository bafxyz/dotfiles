# Language
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Path to your golang installation.
export GOPATH=$HOME/work

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ANDROID_HOME=/usr/local/opt/android-sdk
source $ZSH/oh-my-zsh.sh

# Initialize nvm
#export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

# Initialize rbenv
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Initialize z.
# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
		# Load rupa's z if installed
		[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Shortcuts
alias d="cd ~/Dropbox"
alias www="cd ~/Sites"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"
alias h="history"
alias -- -="cd -"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# Full Recursive Directory Listing
# alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; brew cask cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com; ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# httpdEdit:      Edit httpd.conf
alias httpdEdit='sudo subl /etc/apache2/httpd.conf'
# vhostEdit:       Edit httpd-vhosts.conf
alias vhostEdit='sudo subl /etc/apache2/extra/httpd-vhosts.conf'
# apacheRestart:   Restart Apache
alias apacheRestart='sudo apachectl graceful'
# hostEdit:        Edit /etc/hosts file
alias hostEdit='sudo subl /etc/hosts'
# apache, vhost logs
alias logs="s /var/log/apache2/"

# Echo all executable Paths
alias path='echo -e ${PATH//:/\\n}'

# Quickly search for file
alias f="find . -name "
alias ff="sudo find / -name "

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wild-cherry"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
# Add wisely, as too many plugins slow down shell startup.
plugins=(sudo mvn docker common-aliases dircycle compleat colorize history-substring-search colored-man command-not-found sprunge postgres bower grunt node composer coffee npm osx symfony2 taskwarrior redis-cli z brew last-working-dir web-search zsh-syntax-highlighting)
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='subl'
else
	export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# example: extract file
extract () {
	if [ -f $1 ] ; then
	case $1 in
	*.tar.bz2)   tar xjf $1        ;;
	*.tar.gz)    tar xzf $1     ;;
	*.bz2)       bunzip2 $1       ;;
	*.rar)       unrar x $1     ;;
	*.gz)        gunzip $1     ;;
	*.tar)       tar xf $1        ;;
	*.tbz2)      tar xjf $1      ;;
	*.tbz)       tar -xjvf $1    ;;
	*.tgz)       tar xzf $1       ;;
	*.zip)       unzip $1     ;;
	*.Z)         uncompress $1  ;;
	*.7z)        7z x $1    ;;
	*)           echo "I don't know how to extract '$1'..." ;;
	esac
	else
	echo "'$1' is not a valid file"
fi
}

# example: pk tar file
pk () {
	if [ $1 ] ; then
	case $1 in
	tbz)       tar cjvf $2.tar.bz2 $2      ;;
	tgz)       tar czvf $2.tar.gz  $2       ;;
	tar)      tar cpvf $2.tar  $2       ;;
	bz2)    bzip $2 ;;
	gz)        gzip -c -9 -n $2 > $2.gz ;;
	zip)       zip -r $2.zip $2   ;;
	7z)        7z a $2.7z $2    ;;
	*)         echo "'$1' cannot be packed via pk()" ;;
	esac
	else
	echo "'$1' is not a valid file"
fi
}

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}";
	sleep 1 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
	local port="${1:-4000}";
	local ip=$(ipconfig getifaddr en1);
	sleep 1 && open "http://${ip}:${port}/" &
	php -S "${ip}:${port}";
}

# `s` with no arguments opens the current directory in Sublime Text, otherwise
# opens the given location
function s() {
	if [ $# -eq 0 ]; then
		subl .;
	else
		subl "$@";
	fi;
}

# `v` with no arguments opens the current directory in Vim, otherwise opens the
# given location
function v() {
	if [ $# -eq 0 ]; then
		vim .;
	else
		vim "$@";
	fi;
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}
