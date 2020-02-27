#!/bin/bash

function offline {
	[[ ! $1 ]] && help_err offline
	INITIALPWD=$PWD
	local action=$1
	if [[ $action == "make" ]]; then
		MAKEFOLDER=$(mktemp -d) && \
		cp -r -P $HOME/.homesick $MAKEFOLDER/ && \
		find $HOME/.homesick -mindepth 3 -maxdepth 3 -name 'makeoffline.sh' -exec {} "$MAKEFOLDER" \; && \
		tar -jcf environment.tbz -C $MAKEFOLDER . && \
		success "environment.tbz compressed in $PWD" && rm -rf "$MAKEFOLDER"
	elif [[ $action == "deploy" ]]; then
		$HOME/.homesick/repos/homeshick/bin/homeshick link
	else
		help_err offline
	fi
	return $EX_SUCCESS
}
