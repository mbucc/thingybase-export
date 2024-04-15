#! /bin/sh -e

source ./scripts/_lib.sh
get "accounts.json" | jq ".[0].url" | tr -d \"
