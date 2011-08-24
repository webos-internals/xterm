#!/bin/sh

APP_DIR=`dirname $0`

export DISPLAY=:0.0

export PATH=${APP_DIR}/bin:${PATH}

RESPONSE=$(luna-send -f -n 1 palm://org.webosinternals.tweaks.prefs/get '{"owner":"org.webosinternals.xterm", "keys":["fgColor","bgColor"]}')

export FG="-fg $(echo "$RESPONSE"| grep fgColor|cut -d\" -f4|tr -cd 'a-zA-Z0-9')"
export BG="-bg $(echo "$RESPONSE"| grep bgColor|cut -d\" -f4|tr -cd 'a-zA-Z0-9')"

# Run xterm maximized...
if [ "$FG" == "-fg " ]; then
    export FG="";
fi

if [ "$BG" == "-bg " ]; then
    export BG="";
fi

${APP_DIR}/bin/xterm -maximize $FG $BG -e "login -f root" &> /tmp/xterm.log &

