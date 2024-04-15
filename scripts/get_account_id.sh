#! /bin/sh -e
# Extract account ID from account URL.
#
# The account URL is assumed to have the format:
#
#	https://www.thingybase.com/accounts/<acct_id>.json

awk -F/ '{print $NF}' | sed 's/\.json//'
