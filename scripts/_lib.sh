#! /bin/sh -e

[ "x$THINGYBASE_KEY" = "x" ] && echo "Please set THINGYBASE_KEY to your API key" >&2 && exit 1

function get() {
    U=$(echo "$1" |tr -d '"')
    curl -sS -H "Authentication: apitoken $THINGYBASE_KEY" "https://www.thingybase.com/$U"
}

