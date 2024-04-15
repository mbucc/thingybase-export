#! /bin/sh -e

source ./scripts/_lib.sh

ACCOUNT_ID=$(cat $1)

get "accounts/$ACCOUNT_ID/items" \
	| xmllint --html --xpath '//a[starts-with(@href, "/items/")]' - \
	2>/dev/null \
	| sort
