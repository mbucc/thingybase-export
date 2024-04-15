#! /bin/sh -e

IN_DIR="$1"

# F=work/items_html/<item-id>_NAME
TMPF=$(mktemp work/tmpfile.XXXXXXXXX)
for ITEM_NAME_FILE in $(ls $IN_DIR/*_NAME); do
	ITEM_ID=$(echo $ITEM_NAME_FILE | sed 's/_NAME//' | sed "s;${IN_DIR}/;;")
	printf "%s\t%s\n" "$(cat $ITEM_NAME_FILE)" "$ITEM_ID" >> "$TMPF"
done

FIRST=1
IFS=$'\n'
for NAME_ID_PAIR in $(cat $TMPF|sort -n); do

	ITEM_NAME=$(echo "$NAME_ID_PAIR" | cut -d '	' -f1)
	ITEM_ID=$(echo   "$NAME_ID_PAIR" | cut -d '	' -f2)

	if [ "$FIRST" -eq 0 ] ; then
		printf "\n\n"
	fi
	printf "%s\n" "$ITEM_NAME"
	echo "-----------------------------------------------\n"

	F="$IN_DIR/$ITEM_ID.html"
	xmllint --html --xpath '//a[@class="link"]' - 2>/dev/null < $F \
		| sed -e 's/<[^>]*>//g' \
		| sed 's/  *$//' \
		| sed 's/^/  * /' \
		| sort -f

	FIRST=0
done
