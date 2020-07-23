#!/bin/bash
LOCKFILE="$0"
( if flock -n 99
  then
      echo Running task
      sleep 20
      echo Done
      exit 0
  else
      echo You can only run one copy of this script at a time!
      exit 1
  fi ) 99<"$LOCKFILE"

  
      
  
