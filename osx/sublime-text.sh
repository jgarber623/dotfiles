#!/bin/bash

###############################################################################
# Sublime Text 2                                                              #
###############################################################################

ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

rm -rf ~/Library/Application\ Support/Sublime\ Text\ 2;
ln -fs ~/Dropbox/Library/Application\ Support/Sublime\ Text\ 2/ ~/Library/Application\ Support/Sublime\ Text\ 2;