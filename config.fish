# ~/.config/fish/config.fish

# golang
set GOPATH $HOME/go
set GOROOT /usr/local/opt/go/libexec
set PATH $PATH:$GOPATH/bin
set PATH $PATH:$GOROOT/bin

# aliases
alias www="cd ~/Sites"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias h="history"
alias ip="ifconfig | grep 'inet ' | grep -v 127.0.0."
alias update="sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; brew cask cleanup; npm install npm -g; npm update -g;"
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias f="find . -name "
alias ff="sudo find / -name "
alias o="open . "
alias l="ls -la"
alias git="env LANG=en_GB git"
