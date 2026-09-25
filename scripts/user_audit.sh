#!/usr/bin/env bash
# user_audit.sh - basic account audit (read-only).
set -euo pipefail

echo "== Users with a login shell =="
awk -F: '$7 !~ /(nologin|false)$/ {print $1 " (uid " $3 ")"}' /etc/passwd

echo "== Accounts with UID 0 (should be only root) =="
awk -F: '$3 == 0 {print $1}' /etc/passwd

echo "== Last 5 logins =="
last -n 5
