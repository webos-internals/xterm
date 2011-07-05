#!/bin/sh

APP_DIR=`basename $0`

export DISPLAY=:0.0

export PATH=${APP_DIR}/bin:${PATH}

${APP_DIR}/bin/xkbcomp -R${APP_DIR}/share/X11/xkb/keymap palm-prex ${DISPLAY}

${APP_DIR}/bin/xkbset exp 60 =sticky =twokey =latchlock
${APP_DIR}/bin/xkbset sticky -twokey latchlock

#This sizes the xterm, using default font, to more or less fill the screen.
${APP_DIR}/bin/xterm -geometry 52x36+0+0 -e "login -f root" 2>&1 >& /tmp/xterm.log &
