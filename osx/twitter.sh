#!/bin/bash

###############################################################################
# Twitter.app                                                                 #
###############################################################################

# Disable smart quotes as it’s annoying for code tweets
# defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false

# Enable the hidden ‘Develop’ menu
defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true

# Open links in the background
# defaults write com.twitter.twitter-mac openLinksInBackground -bool true

# Allow closing the ‘new tweet’ window by pressing `Esc`
defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true;

# Show full names rather than Twitter handles
defaults write com.twitter.twitter-mac ShowFullNames -bool true

# Hide the app in the background if it’s not the front-most window
# defaults write com.twitter.twitter-mac HideInBackground -bool true

# Compose window behaves like a normal window
defaults write com.twitter.twitter-mac NormalComposeWindowLevel -bool true;