#!/usr/bin/env bash
#	set -x
	set -e
	
	shopt -s extglob
	
	: ${name:=regexp}
	: ${tmp:=.vscode/tmp}
	
	example=examples/"$name"
	
