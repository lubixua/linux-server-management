# linux-server-management

Bash scripts and documentation for basic Linux server administration: disk monitoring, service checks, backups and user auditing.

## Purpose
Give junior admins reliable, documented, reviewed scripts for routine checks, and demonstrate a professional team Git workflow.

## Project structure
```
linux-server-management/
├── README.md
├── CONTRIBUTING.md
├── .gitignore
├── .gitattributes
├── .github/pull_request_template.md
├── scripts/
│   ├── disk_check.sh        # warns when filesystems are nearly full
│   ├── service_status.sh    # checks systemd services
│   ├── backup.sh            # compressed backups with retention
│   └── user_audit.sh        # read-only account audit
├── config/example.conf
├── tests/test_retention.sh
└── docs/
    ├── installation.md
    ├── configuration.md
    ├── troubleshooting.md
    ├── security-notes.md
    └── incident-report.md
```

## Quick start
See [docs/installation.md](docs/installation.md).

## Development workflow
1. Create a branch from `main`.
2. Commit small, meaningful changes (`type: description`).
3. Push and open a Pull Request (What / Why / How tested).
4. A teammate reviews with the checklist in [CONTRIBUTING.md](CONTRIBUTING.md).
5. Fix review comments, get approval, merge with a merge commit.

## Branching strategy
- `main`: stable only, protected, PR + 1 approval required.
- `feature/<name>`: new functionality.
- `docs/<name>`: documentation changes.
- `hotfix/<name>`: urgent fixes and reverts.

## Contribution process
Follow [CONTRIBUTING.md](CONTRIBUTING.md). Reviewers evaluate functionality, organization, documentation, potential problems, maintainability and security.

## Testing process
- Lint: `shellcheck scripts/*.sh tests/*.sh`
- Regression: `bash tests/test_retention.sh`
- Manual: run the changed script and record the command and output in the PR.

## Troubleshooting process
Reproduce, read the error, trace with `bash -x`, and if it's a regression use `git bisect`. See [docs/troubleshooting.md](docs/troubleshooting.md).

## Project history highlights
- PR #2: review cycle (changes requested, fixed, approved).
- PR #5/#6: merge conflict on disk_check.sh, resolved by combining both changes.
- PR #8/#10: incorrect retention change, found during investigation (which also uncovered a missing regression test from PR #7), recovered with git revert. See [docs/incident-report.md](docs/incident-report.md).
