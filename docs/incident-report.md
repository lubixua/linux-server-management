# Incident Report: Backups deleted too aggressively

## Summary
After PR #8 was merged, backup.sh deleted every backup older than one day.

## Timeline
- PR #7 merged: retention feature with RETENTION_DAYS default 7. The regression test intended for this PR (tests/test_retention.sh) was not actually committed at the time, only an empty placeholder file was.
- PR #8 merged: default changed to 0 "to save disk space", with no regression test in place to catch it.
- PR #9 merged: unrelated development continued on top.
- Problem reported. While investigating, the missing test file was discovered and added, then used to reproduce the failure (FAIL) against main.
- The commit that reduced RETENTION_DAYS to 0 was identified via git log search and confirmed with git show.
- PR #10: git revert -m 1 of the PR #8 merge restored the default of 7. Test passes.

## Root cause
Two compounding issues: (1) a default value was changed without a working regression test in place to catch it, and (2) the regression test itself had silently failed to be committed in PR #7, so its absence went unnoticed during review.

## Impact
Backups older than 24 hours would be removed on every run.

## Resolution
Added the missing regression test, then reverted the bad default with git revert (history preserved). Later work from PR #9 kept.

## Lessons and prevention
- Always verify a new test file is actually tracked (git status, git show --stat) before committing, not just that the commit succeeded.
- Run tests/test_retention.sh before every PR touching backup.sh.
- Reviewers must check the "How it was tested" section and, where practical, re-run the referenced test themselves.
- Destructive defaults (-delete) need extra care in review.
