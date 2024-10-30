#!/bin/bash

url="https://www.bing.com/search?q="
query=$(echo "$@" | sed "s/ /+/g")
url+="$query"

echo "$url"


curl -s -L -A Lynx "$url" |\
tr -d '\n' | tr '<' '\n' | tr '>' ' ' | tr ';' '\n' |\
sed 's/" /\n/g' |\
grep -oP 'https?://[^"]+' |\
grep -v "bing.com\|microsoft.com\|creativecommons.org\|live.com" |\
sort -u
