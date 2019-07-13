#!/bin/bash
function ess(){
	LAST_SCREEN_SHOT=$(ls ~/Pictures | egrep -i '^screenshot' | tail -n 1)
	gimp ~/Pictures/"$LAST_SCREEN_SHOT"
}

function lspackage(){
	(zcat $(ls -tr /var/log/apt/history.log*.gz); cat /var/log/apt/history.log) 2>/dev/null |
  egrep '^(Start-Date:|Commandline:)' |
  grep -v aptdaemon |
  egrep -B1 '^Commandline:'
}
