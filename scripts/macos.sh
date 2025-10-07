#!/usr/bin/env bash

# Close System Preferences to prevent overriding
osascript -e 'tell application "System Preferences" to quit'

# Enable Touch ID for sudo
if ! grep -q "pam_tid.so" /etc/pam.d/sudo; then
    sudo sed -i '' '1a\
auth       sufficient     pam_tid.so
' /etc/pam.d/sudo
    echo "Touch ID enabled for sudo"
fi

# Require password immediately after sleep
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable boot sound
sudo nvram SystemAudioVolume=" "

# Expand save/print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Save to disk (not iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Trackpad: tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Fast keyboard repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Finder: show all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar and path bar
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Finder: default to list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder: show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: disable warning when changing extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store on network/USB
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show ~/Library
chflags nohidden ~/Library

# Dock: auto-hide
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Dock: minimize to app icon
defaults write com.apple.dock minimize-to-application -bool true

# Dock: don't rearrange spaces
defaults write com.apple.dock mru-spaces -bool false

# Screenshots: save to desktop as PNG
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

# Activity Monitor: show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Restart affected apps
killall Finder Dock SystemUIServer

echo "Done. Some changes require logout/restart."
