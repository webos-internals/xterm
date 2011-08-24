#!/bin/sh

APP_DIR=`dirname $0`

export DISPLAY=:0.0

export PATH=${APP_DIR}/bin:${PATH}

. ${APP_DIR}/get_colors.inc

${APP_DIR}/bin/xterm -maximize $FG $BG -e "login -f root" &> /tmp/xterm.log &

