#!/bin/sh
#Launches the x server, with a particular app in it.

#This is where the X server lives
X_DIR=/media/cryptofs/apps/usr/palm/applications/org.webosinternals.xorg-server
#Where the app we're invoking lives
APP_DIR=/media/cryptofs/apps/usr/palm/applications/org.webosinternals.xterm-bin

#XXX: We might want/need a way to get/set unique DISPLAY's for the case of launching
#multiple servers, perhaps each with their own app.  For now it's just one-at-a-time,
#with the nice 'fallback' of if you try to launch a new one the server will fail
#and the client will run in the existing one.
#(but without wm that might not be ideal, but better than crashing)
export DISPLAY=:0.0

#Start the x-server
$X_DIR/start.sh

#Start xterm

#This sizes the xterm, using default font, to more or less fill the screen.
$APP_DIR/xterm -geometry 52x36+0+0
