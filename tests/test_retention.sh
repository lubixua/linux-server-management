#!/usr/bin/env bash
# Sandbox test: with default retention, a 3-day-old backup must be kept.
set -u
T="$(mktemp -d)"
mkdir "$T/src" "$T/dest"
echo data > "$T/src/file.txt"
touch -d "3 days ago" "$T/dest/backup_old.tar.gz"

./scripts/backup.sh "$T/src" "$T/dest" > /dev/null

if [[ -f "$T/dest/backup_old.tar.gz" ]]; then
  echo "PASS: 3-day-old backup was kept"
  rm -rf "$T"; exit 0
else
  echo "FAIL: 3-day-old backup was deleted"
  rm -rf "$T"; exit 1
fi
