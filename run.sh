#!/bin/bash

echo "Fetching statuspage"
awk -v FS='\t' -v OFS='' '($4=="statuspage") {print "echo ",$1,"; mkdir -p data/",$1,"; curl -s -f ",$3,"/api/v2/summary.json | jq > data/",$1,"/summary.json"}' companies.tsv | bash
awk -v FS='\t' -v OFS='' '($4=="statuspage") {print "echo ",$1,"; mkdir -p data/",$1,"; curl -s -f ",$3,"/api/v2/incidents.json | jq > data/",$1,"/incidents.json"}' companies.tsv | bash
echo "Fetching instatus"
awk -v FS='\t' -v OFS='' '($4=="instatus") {print "echo ",$1,"; mkdir -p data/",$1,"; curl -s -f ",$3," | hxnormalize -x | hxselect -c \"#__NEXT_DATA__\" | jq \".props.pageProps | del(.startDate,.endDate)\" > data/",$1,"/data.json"}' companies.tsv | bash
