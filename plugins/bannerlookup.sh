#!/bin/bash
# AUTHOR NAME = SecureAxom (Mridupawan)

curl -s "https://api.hackertarget.com/bannerlookup/?q=$1" | jq -r | tr -d {} | tr -d [] | sed 's/ //g' | sed 's/"//g' | sed 's/,//g'
