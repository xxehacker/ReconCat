#!/bin/bash
# AUTHOR NAME = SecureAxom (Mridupawan)

res=$(curl "https://api.dehash.lt/api.php?search=$1" -s | awk -F  ":" '{print $2}')

echo -e "Decrypt Hash : $res"

