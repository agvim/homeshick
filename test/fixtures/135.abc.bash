#!/usr/bin/env bash
(
	local git_username="Homeshick user"
	local git_useremail="homeshick@example.com"
	local weirdname="$REPO_FIXTURES/135.abc"
	git init $weirdname
	cd $weirdname
	git config user.name $git_username
	git config user.email $git_useremail
	touch .gitkeep
	git add .gitkeep
	git commit -m 'Add file to repo with weird name'
) > /dev/null
