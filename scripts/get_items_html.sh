#! /bin/sh -e
# Input lines expected as:
#
#	<a href="/items/<item-id>" class="link">02 Books (lq)</a>
#
# Sorts by filename (numerically) and get's HTML if it has not been downloaded.
#

source ./scripts/_lib.sh

OUT_DIR="$1"

IFS=$'\n'
sed -e 's/^.*href="//' -e 's/".*"link">/	/' -e 's;</a>;;' \
| awk 'BEGIN {FS=OFS="\t"} {print $2, $1}' \
| sort -n \
| while read ITEM; do

	printf "."

	ITEM_NAME=$(echo "$ITEM"|cut -d'	' -f1)
	ITEM_URL=$(echo $ITEM|cut -d'	' -f2)
	ITEM_ID=$(echo $ITEM_URL|sed 's;.*/;;')

	HTML_FN="$OUT_DIR/${ITEM_ID}.html"
	if [ ! -f "$HTML_FN" ]; then
		get $ITEM_URL > "$HTML_FN"
	fi

	echo "$ITEM_NAME" > "$OUT_DIR/${ITEM_ID}_NAME"

done
