#!/bin/bash
URL="https://api.hackerearth.com/v4/partner/code-evaluation/submissions/"
CLIENT_SECRET="54ba59feaff5eb3bc7541937035dd44f8e629065"

while read lib; do
  SOURCE_CODE="require '$lib' \n puts RUBY_VERSION"
  echo "Testing $lib"
  STATUS_URL=`curl --silent -H "client-secret:$CLIENT_SECRET" \
    -H "content-type:application/json" \
    --data-raw "{\"lang\":\"RUBY\",\"source\":\"$SOURCE_CODE\",\"context\":\"$lib\"}" $URL | jq -r '.status_update_url'`
  echo $STATUS_URL
  sleep 2
  curl -H "client-secret:$CLIENT_SECRET" "$STATUS_URL" > "$lib.json"
done < libs.txt

#Generate the report
find . -iname "*.json" | xargs ruby report.rb > REPORT.md
