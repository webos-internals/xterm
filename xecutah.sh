#!/bin/sh

APP_DIR=`dirname $0`

export DISPLAY=:0.0

export PATH=${APP_DIR}/bin:${PATH}

# Run xterm maximized...
${APP_DIR}/bin/xterm -maximize -e "login -f root" &> /tmp/xterm.log &
