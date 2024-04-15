report.html: report.md
	cmark $< > t
	mv t $@

report.md: work/items_html scripts/report.sh
	./scripts/report.sh $< > t
	mv t $@

work/items_html: work/ITEMS scripts/get_items_html.sh
	mkdir -p $@
	./scripts/get_items_html.sh $@ < $<

work/ITEMS: work/ACCOUNT_ID scripts/get_items.sh
	./scripts/get_items.sh $< > t
	mv t $@

work/ACCOUNT_ID: work/ACCOUNT_URL scripts/get_account_id.sh
	./scripts/get_account_id.sh < $< > t
	mv t $@

work/ACCOUNT_URL: scripts/get_account_url.sh
	./scripts/get_account_url.sh > t
	mkdir -p work
	mv t $@


.PHONY: clean
clean:
	rm -rf work
	rm -f report.md report.html
