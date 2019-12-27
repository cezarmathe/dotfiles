#!/usr/bin/env bash

function git_additions_deletions() {
	local username="$1"; shift
	local branch="$1"; shift
	git log --author=${username} --shortstat ${branch} | \
		awk '/^ [0-9]/ { f += $1; i += $4; d += $6 } \
		END { printf("%d files changed, %d insertions(+), %d deletions(-)\n", f, i, d) }'
}
