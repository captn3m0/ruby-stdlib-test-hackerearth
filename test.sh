#!/bin/bash

while read lib; do
  SOURCE="require%20'$lib'"
  echo "Testing $lib"
  curl -s -d "client_secret=54ba59feaff5eb3bc7541937035dd44f8e629065&lang=RUBY&async=0&source=$SOURCE" http://api.hackerearth.com/code/run/ > $lib.json
done < libs.txt

#Generate the report
find . -iname "*.json" | xargs ruby report.rb > REPORT.md