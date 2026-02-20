## 1. Update Dependency Constraints

- [x] 1.1 Add `mkdocs<2.0` constraint to `requirements.txt` as a new line
- [x] 1.2 Update `mkdocs` to `mkdocs<2.0` in `requirements-dev.txt`

## 2. Validate Constraints

- [x] 2.1 Test local dependency installation with `pip install -r requirements.txt` in a clean virtualenv
- [x] 2.2 Verify MkDocs version installed is 1.x (not 2.x) using `pip show mkdocs`
- [x] 2.3 Test local dependency installation with `pip install -r requirements-dev.txt` in a clean virtualenv
- [x] 2.4 Verify both requirements files install the same MkDocs version

## 3. Test Documentation Build

- [x] 3.1 Run `mkdocs build` locally to verify documentation builds successfully
- [x] 3.2 Check build output for absence of MkDocs 2.0 incompatibility warnings
- [x] 3.3 Verify generated documentation content is correct

## 4. Commit Changes

- [ ] 4.1 Stage changes to `requirements.txt` and `requirements-dev.txt`
- [ ] 4.2 Create commit with conventional commit message explaining MkDocs 2.0 incompatibility
- [ ] 4.3 Reference Material for MkDocs blog post (https://squidfunk.github.io/mkdocs-material/blog/2026/02/18/mkdocs-2.0/) in commit body
- [ ] 4.4 Push branch and create pull request

## 5. Verify CI Build

- [ ] 5.1 Wait for CI `update-docs` workflow to complete
- [ ] 5.2 Verify workflow installs MkDocs 1.x (not 2.x)
- [ ] 5.3 Confirm documentation builds successfully in CI
- [ ] 5.4 Check CI logs for absence of MkDocs 2.0 warnings

## 6. Merge and Deploy

- [ ] 6.1 Get PR approval
- [ ] 6.2 Merge PR to main branch
- [ ] 6.3 Verify post-merge documentation build succeeds
- [ ] 6.4 Confirm GitHub Pages documentation is accessible and up-to-date
