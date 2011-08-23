#!/bin/sh

APP_DIR=`dirname $0`

export DISPLAY=:0.0

export PATH=${APP_DIR}/bin:${PATH}

RESPONSE=$(luna-send -n 1 palm://org.webosinternals.tweaks.prefs/get '{"owner":"org.webosinternals.xterm", "keys":["fgColor","bgColor"]}')

export FG="-fg $(echo $RESPONSE| cut -d, -f2|tail -c +11|sed "s/[\",{,}]//g")"
export BG="-bg $(echo $RESPONSE| cut -d, -f3|tail -c +11|sed "s/[\",{,}]//g")"

# Run xterm maximized...
if [ "$FG" == "-fg " ]; then
    export FG="";
fi

if [ "$BG" == "-bg " ]; then
    export BG="";
fi

${APP_DIR}/bin/xterm -maximize $FG $BG -e "login -f root" &> /tmp/xterm.log &

