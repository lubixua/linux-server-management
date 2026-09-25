#!/usr/bin/env bash
set -euo pipefail

usage() { echo "Usage: $0 <source_dir> [backup_dir]" >&2; exit 1; }

[[ $# -ge 1 ]] || usage
SRC="$1"
DEST="${2:-${BACKUP_DIR:-$HOME/backups}}"

[[ -d "$SRC" ]] || { echo "ERROR: '$SRC' is not a directory" >&2; exit 2; }
mkdir -p "$DEST"

ARCHIVE="$DEST/backup_$(date +%F_%H%M%S).tar.gz"
tar -czf "$ARCHIVE" -C "$(dirname "$SRC")" "$(basename "$SRC")"
chmod 600 "$ARCHIVE"
echo "Backup created: $ARCHIVE"
