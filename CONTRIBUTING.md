# Contributing

## Workflow
1. Branch from `main`: `feature/<name>`, `docs/<name>` or `hotfix/<name>`.
2. Make small, focused commits: `type: description` (`feat`, `fix`, `docs`, `test`, `chore`, `revert`).
3. Run `shellcheck` on every changed script and test it.
4. Push and open a Pull Request; fill in What / Why / How tested.
5. A teammate reviews using the checklist below. Address every comment.
6. After approval, merge with a merge commit. Never push directly to `main`.

## Code review checklist
- [ ] **Functionality:** does it do what the PR says? Edge cases handled?
- [ ] **Organization:** right folder, clear names, focused commits?
- [ ] **Documentation:** docs/README updated?
- [ ] **Potential problems:** unquoted variables, missing error handling, destructive commands?
- [ ] **Maintainability:** no hardcoded paths, readable?
- [ ] **Security:** no chmod 777, no secrets, input validated?
