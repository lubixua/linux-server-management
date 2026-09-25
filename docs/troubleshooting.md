# Troubleshooting

## General process
1. Reproduce the problem and note the exact command and error.
2. Read the message; check journalctl or the script output.
3. Isolate: run with `bash -x scripts/<name>.sh` to trace it.
4. If it used to work, find the change: git log, git bisect.
5. Fix on a branch, test, open a PR.

## Common problems
| Symptom | Cause | Fix |
|---|---|---|
| Permission denied running a script | Not executable | `chmod +x scripts/<name>.sh` |
| bad interpreter / ^M errors | Windows line endings | `dos2unix scripts/*.sh` |
| service_status.sh says FAIL | Service stopped or wrong name | `systemctl status <svc>` |
| backup.sh: "not a directory" | Wrong path | Use an absolute path that exists |
| disk_check.sh prints nothing | Nothing above threshold | Test with `DISK_THRESHOLD=1` |
| Old backups vanish | Retention too aggressive | Check RETENTION_DAYS; run tests/test_retention.sh |
