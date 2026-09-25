# Installation

## Requirements
- Linux (tested via WSL/Ubuntu), bash 4+, coreutils
- systemd (only for `service_status.sh`)
- Optional: `shellcheck` for linting (`sudo apt install shellcheck`)

## Install
    git clone https://github.com/lubixua/linux-server-management.git
    cd linux-server-management
    chmod +x scripts/*.sh

## Verify
    ./scripts/disk_check.sh

No output means every filesystem is below the threshold.

## Backup script usage
    ./scripts/backup.sh /path/to/source_dir

Creates a compressed archive of the source directory.
