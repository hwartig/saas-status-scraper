#!/bin/bash

awk -v FS='\t' -v OFS='' '($4=="statuspage") {print "mkdir -p data/",$1,"; curl -f",$3,"/api/v2/summary.json | jq > data/",$1,"/summary.json"}' companies.tsv | bash
awk -v FS='\t' -v OFS='' '($4=="statuspage") {print "mkdir -p data/",$1,"; curl -f",$3,"/api/v2/incidents.json | jq > data/",$1,"/incidents.json"}' companies.tsv | bash
