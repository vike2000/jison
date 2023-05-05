#!/usr/bin/env bash
	. "$(dirname "$0")"/_common.sh
	
	sed -E '/^(<[^<>]*>)[[:space:]]+/s//\1/' "$example".vscode-jison > "$example".jison
	