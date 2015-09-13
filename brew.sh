#!/usr/bin/env bash
xcode-select --install

# Enable debugger in Safary
defaults write com.apple.Safari IncludeDebugMenu 1

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# zsh bash shell
brew install zsh
# Add oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# Make zsh default shell
chsh -s /bin/zsh

# Install z https://github.com/rupa/z
brew install z

# Install git
brew install git

# Install Node Version Manager.
brew install nvm
mkdir ~/.nvm
cp $(brew --prefix nvm)/nvm-exec ~/.nvm/

# Show list of available node versions
nvm ls-remote

# Install node version 4
nvm install 4
nvm use 4
# Set default version of node to new terminal window
nvm alias default 4

# Upgrade npm to latest version
npm install -g npm@latest

# Install PHP.
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew install php56 --with-postgresql
brew install php56-mcrypt
brew install php56-apcu
brew install php56-xdebug

# Install RabbitMQ
# brew install rabbitmq

# To have launchd start php56 at login:
ln -sfv /usr/local/opt/php56/*.plist ~/Library/LaunchAgents

# Then to load php56 now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist

# Install Composer
brew install composer

# Install phpmyadmin
brew install phpmyadmin

# Install Mysql
brew install mysql

# To have launchd start mysql at login:
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents

# Then to load mysql now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

# Install Postgresql
brew install postgresql

# Install phppgadmin
brew install phppgadmin

# To have launchd start postgresql at login:
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

# Then to load postgresql now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Install Redis
brew install redis
brew install php56-redis

# To have launchd start redis at login:
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents

# Then to load redis now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

# Install Ruby
brew install rbenv ruby-build

# List Ruby versions
rbenv install -l

# Example of global ruby 2.2.3 installation
rbenv install 2.2.3
rbenv global 2.2.3

# Install python
# brew install python
# pip install --upgrade pip
# pip install --upgrade setuptools

# Install android-sdk
brew install android-sdk
brew install ant
brew install Caskroom/cask/genymotion

# Install html linter
# brew install homebrew/dupes/tidy

# Remove outdated versions from the cellar.
brew cleanup

# Node packages
# npm install -g jscs
npm install -g csslint
# npm install -g stylint
npm install -g webpack
npm install webpack-dev-server --global

# Ruby packages
gem install sass
gem install scss-lint

# Task manager
brew install task
