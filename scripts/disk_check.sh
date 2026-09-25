#!/usr/bin/env bash
# disk_check.sh - warn when a filesystem is above a usage threshold.
# Usage: ./disk_check.sh
THRESHOLD=80

df -P -x tmpfs -x devtmpfs | awk 'NR>1 {print $5, $6}' | while read -r usage mount; do
  pct="${usage%\%}"
  [[ "$pct" =~ ^[0-9]+$ ]] || continue
  if [ "$pct" -ge "$THRESHOLD" ]; then
    echo "WARNING: $mount is at ${usage}"
  fi
done
