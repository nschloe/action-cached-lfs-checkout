version := "1.2.2"

default:
	@echo "\"just publish\"?"

publish:
	@if [ "$(git rev-parse --abbrev-ref HEAD)" != "main" ]; then exit 1; fi
	gh release create "v{{version}}"

	# make sure the v1 tag points to the latest tag
	git tag -fa v1 -m "update"
	git push --force --tags

format:
	prettier --write README.md action.yml
