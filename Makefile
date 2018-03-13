validate-no-uncommitted-package-lock-changes:
	git diff --name-only --exit-code *package-lock.json
