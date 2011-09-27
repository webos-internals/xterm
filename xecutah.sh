#!/bin/sh

export DISPLAY=${1:-:0.0}

APP_DIR=`dirname $0`

export PATH=${APP_DIR}/bin:${PATH}

. ${APP_DIR}/get_colors.inc

${APP_DIR}/bin/xterm -display ${DISPLAY} -maximize $FG $BG -xrm "*metaSendsEscape: true" -u8 -e "login -p -f root" &> /tmp/xterm.log &

