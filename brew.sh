#!/usr/bin/env bash
xcode-select --install

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install z https://github.com/rupa/z
brew install z

# Install git
brew install git

# Install Node.js. Note: this installs `npm` too, using the recommended
# installation method.
brew install node

# Install PHP.
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew install php56 --with-postgresql

# To have launchd start php56 at login:
ln -sfv /usr/local/opt/php56/*.plist ~/Library/LaunchAgents

# Then to load php56 now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist

# Install Composer
brew install composer

# Install Mysql
brew install mysql

# To have launchd start mysql at login:
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents

# Then to load mysql now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

# Install Postgresql
brew install postgresql

# To have launchd start postgresql at login:
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

# Then to load postgresql now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Install Redis
brew install Redis

# To have launchd start redis at login:
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents

# Then to load redis now:
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

# Remove outdated versions from the cellar.
brew cleanup
