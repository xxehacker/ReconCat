#!/bin/bash
# AUTHOR NAME = SecureAxom (Mridupawan)



#api = "w9it3qtxbh6q6tpnd5nc57n5x6vhi47rf6vwlbxfas5uj55z6jvxu9w5tfzh9j41jr2rzg"
curl -sk "https://whatcms.org/API/Tech?key=$1&url=$2" | jq -r ."results[]" | sed 's/{/ /g' |  sed 's/}/ /g' |  sed 's/"/ /g' | column -t 

