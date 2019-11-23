#!/bin/bash

while read lib; do
  SOURCE_CODE="require%20'$lib'"
  echo "Testing $lib"
  curl --silent --data-raw "client_secret=54ba59feaff5eb3bc7541937035dd44f8e629065&lang=RUBY&source=$SOURCE_CODE" "https://api.hackerearth.com/v3/code/run/" > $lib.json
done < libs.txt
 
#Generate the report
find . -iname "*.json" | xargs ruby report.rb > REPORT.md
