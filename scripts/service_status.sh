#!/usr/bin/env bash
# service_status.sh - report whether systemd services are running.
# Usage: ./service_status.sh <service> [service...]
set -euo pipefail

[[ $# -ge 1 ]] || { echo "Usage: $0 <service> [service...]" >&2; exit 1; }

rc=0
for svc in "$@"; do
  if systemctl is-active --quiet "$svc"; then
    echo "OK: $svc is running"
  else
    echo "FAIL: $svc is not running"
    rc=1
  fi
done
exit "$rc"
