# Project Tasks

This document tracks micro-tasks to maintain momentum and visibility. Tasks are small, clearly defined, and measurable.

## Completed 

### Documentation
- [x] Audit current docs and script to identify implemented vs unimplemented features
- [x] Create a comprehensive documentation page (`docs/README.md`)
- [x] Refactor documentation to consolidate under `docs/` with root pointer `README.md`
- [x] Update `docs/CHANGELOG.md` with detailed release notes
- [x] Add Troubleshooting section with common failure modes and fixes
- [x] Validate download URL and desktop entry/icon paths against script

### Core Features
- [x] Implement non-interactive/silent mode (`--yes`/`--silent`)
- [x] Add support for custom installation path (`--prefix`)
- [x] Add configuration backup/restore options
- [x] Implement version detection and update check logic
- [x] Add checksum verification for downloaded tarball

### Testing & Quality
- [x] Add BATS test suite for core functionality
- [x] Integrate ShellCheck for static code analysis
- [x] Create automated test runner script
- [x] Add test documentation
- [x] WSL testing setup

## In Progress 

### Testing & Quality
- [ ] Increase test coverage for edge cases
- [ ] Add integration tests for backup/restore functionality
- [ ] Implement CI/CD with GitHub Actions

### Features
- [ ] Add optional PATH export or wrapper script creation
- [ ] Improve progress output with clearer steps and error messages
- [ ] Desktop environment detection for better icon placement
- [ ] Support for more Linux distributions
- [ ] Package manager integration (deb/rpm)

## Completed ✅

### Testing & Quality
- [x] Removed Windows-specific test files
- [x] Updated documentation for WSL-based testing
- [x] Simplified test structure for Linux environments
- [x] Added basic functional tests

## Future Work 

### Testing & Quality
- [ ] Add more test cases for edge cases
- [ ] Implement CI/CD with GitHub Actions
- [ ] Add code coverage reporting

### Documentation
- [ ] Create a man page for the installer
- [ ] Add video tutorials for common workflows
- [ ] Add more detailed examples for advanced usage

## Notes

- The `.vscode/update_readme.py` tool is configured to update `docs/README.md` statistics.
- Keep documentation changes synchronized with `install_ftprush.sh`.
- Follow semantic versioning for releases.
- Write tests for all new features.
