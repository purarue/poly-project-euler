#!/usr/bin/env bash

set -e

function adjacentproduct() {
	RESULT=1
	INPUT=$1
	while [[ -n "$INPUT" ]]; do
		FIRST_CHAR="${INPUT:0:1}" # grab the first char from input
		INPUT=${INPUT:1}          # remove the first character from input string
		((RESULT = RESULT * FIRST_CHAR))
	done
	echo "$RESULT"
}

FULL_STR=$(cat "./data.txt")

MAX_RESULT=0
for i in {0..987}; do
	RES=$(adjacentproduct "${FULL_STR:i:13}")
	if [[ $RES -gt $MAX_RESULT ]]; then
		MAX_RESULT=$RES
	fi
done

echo "$MAX_RESULT"
