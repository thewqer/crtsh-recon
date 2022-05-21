#!/bin/bash

TARGET=$1

echo -e "=|= The target is: '$TARGET'"
echo -e "=|= Extracting the urls from https://crt.sh"

curl -fsSL "https://crt.sh/?q=$TARGET" | pup 'td :contains("'$TARGET'") text{}' | sort -n | uniq -c | sort -rn | column -t | cut -c 5- > $TARGET.txt


echo -e "=|= DONE"
echo -e "=|= Results saved in $TARGET.txt"

echo -e "Scanning with HTTPX"

httpx -l $TARGET.txt -sc -td


echo -e "Scanning done"


# IF NEEDED UNCOMMENT THIS: uniq $TARGET.txt >> $TARGET.txt
