#!/usr/bin/env sh

function dump() {
  echo "Starting dump..."
  mongodump --uri="$MONGO_URL" --out "$BACKUP_DIR" --verbose 
}

function restore() {
  echo "Starting restore..."
  mongorestore --uri="$MONGO_URL" --dir "$BACKUP_DIR" --verbose
}

CMD=$1

echo "$CMD"

case $CMD in
"dump")
  dump
  ;;
"restore")
  restore
  ;;
*)
  dump
  ;;
esac
