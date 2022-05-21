#!/bin/sh

curl https://boards.4chan.org/wg/ \
	| pup 'a[title="Link to this post"] attr{href}' \
	| awk '{print "https://boards.4chan.org/wg/"$1}' \
	| xargs curl \
	| pup "a.fileThumb attr{href}" \
	| awk -F'wg/' '{ if(system("[ ! -f " $2 " ]") == 0) { print "https:"$1"wg/"$2 } }' \
	| sort -u \
	| xargs wget
