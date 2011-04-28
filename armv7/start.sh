#!/bin/sh
#Launches the x server

DISPLAY=:0.0

APP_DIR=/media/cryptofs/apps/usr/palm/applications/org.webosinternals.xterm
KEYMAP_DIR=$APP_DIR/share/X11/xkb/keymap

export PATH=$APP_DIR/bin:$PATH

#Portrait orientation
Xsdl -noreset -nolisten tcp -retro -screen 320x480x24 $DISPLAY &
#Landscape
#Xsdl -noreset -nolisten tcp -retro -screen 480x320x24 $DISPLAY &

sleep 1
xkbcomp -R$KEYMAP_DIR palm-pre $DISPLAY

#XXX: Add code that runs ~/.xinitrc or /media/internal/xinitrc if it exists?


#Start xterm

#This sizes the xterm, using default font, to more or less fill the screen.
xterm -geometry 52x36+0+0 -e "login -f root"
