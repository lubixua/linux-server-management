# Security Notes

- Run scripts as a normal user. Use `sudo` only for the single command that needs it.
- Never use `chmod 777`. Scripts: `755`. Backup archives: `600`.
- Do not store passwords or keys in config files. `.env` is git-ignored.
- Always quote variables and validate arguments.
- Read a script before running it on a production server.
- Give service accounts only the permissions they need (least privilege).
- Test-restore backups periodically. An unverified backup is not a backup.
