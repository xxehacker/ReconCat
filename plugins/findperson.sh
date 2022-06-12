#!/bin/bash
# Author : SecureAxom (Mridupawan)

image=$(curl -sk "https://imsea.herokuapp.com/api/1?q=$1" | jq -r)

image_name=$( echo $image | jq ."image_name" | sed 's/"/ /g')
echo "Queary : $image_name"
results=$( echo $image | jq ."results" | sed 's/"/ /g' | sed -e 's/,/ /g' | column -t)
echo "Results : $results"


