#!/usr/bin/env bash

# stdrice's mac settings

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# ask for the administrator password upfront
sudo -v

# keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ########## #
# Appearance #
# ########## #

# dock settings
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "mineffect" -string "scale"
defaults write com.apple.dock "orientation" -string "bottom"
defaults write com.apple.dock "tilesize" -int "48"
defaults write "autohide" -bool "true"
defaults write com.apple.dock "autohide-delay" -float "0"

# ##### #
# Input #
# ##### #

# keyboard settings
## disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

## disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

## disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

## disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

## disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# trackpad settings
## enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# ##### #
# Power #
# ##### #

# require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# ###### #
# Finder #
# ###### #

# show file extension
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# show path bar
defaults write com.apple.Finder ShowPathbar -bool true

# disable animation when opening the Info window in Finder
defaults write com.apple.Finder DisableAllAnimations -bool true

# ##### #
# Other #
# ##### #

# disable animations when opening and closing windows
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# disable animations when opening a Quick Look window
defaults write -g QLPanelAnimationDuration -float 0

# ######## #
# Finalize #
# ######## #

killall Dock
killall Finder