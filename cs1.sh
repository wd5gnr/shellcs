#!/bin/bash

LOGFILE="/tmp/cs.log"
LOCKFILE="$0"

if [ -z "$1" ]
then   # launch two times
    rm "$LOGFILE"
    "$0" A &
    "$0" B &
    wait
    echo Done. Here is the log file
    cat "$LOGFILE"
    exit 0
fi
if [ "$1" == "A" ]
then
    ( flock 99 
    echo Here is a log entry from A along with a directory of /etc >>"$LOGFILE"
    ls /etc >>"$LOGFILE"
    echo That is all from A >>"$LOGFILE" ) 99<"$LOCKFILE"
   exit 0
fi
if [ "$1" == "B" ]
then
    ( flock 99
    echo Here is a log entry from B along with a directory of /usr >>"$LOGFILE"
    ls /usr >>"$LOGFILE"
    echo That is all from B >>"$LOGFILE" ) 99<"$LOCKFILE"
    exit 0
fi
echo Unknown option!
exit 1

    
