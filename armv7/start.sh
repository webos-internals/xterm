#!/bin/sh

APP_DIR=`dirname $0`

export DISPLAY=:0.0

export PATH=${APP_DIR}/bin:${PATH}

#Portrait orientation
${APP_DIR}/bin/forker ${APP_DIR}/bin/Xsdl -noreset -nolisten tcp -retro -screen 320x480x24 ${DISPLAY}
#Landscape
#${APP_DIR}/bin/forker ${APP_DIR}/bin/Xsdl -noreset -nolisten tcp -retro -screen 480x320x24 ${DISPLAY}

sleep 1
${APP_DIR}/bin/xkbcomp -R${APP_DIR}/share/X11/xkb/keymap palm-prex ${DISPLAY}

${APP_DIR}/bin/xkbset exp 60 =sticky =twokey =latchlock
${APP_DIR}/bin/xkbset sticky -twokey latchlock

#XXX: Add code that runs ~/.xinitrc or /media/internal/xinitrc if it exists?

#Start xterm

#This sizes the xterm, using default font, to more or less fill the screen.
${APP_DIR}/bin/xterm -geometry 52x36+0+0 -e "login -f root"
