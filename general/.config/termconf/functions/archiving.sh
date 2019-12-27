#!/usr/bin/env bash

function targz() {
	local filename
	filename="$1"

	tar -cjf "${filename}.tar.gz" "${filename}"
}

function tarxz() {
	local filename
	filename="$1"

	tar cv "${filename}" | xz > "${filename}.xz"
}
