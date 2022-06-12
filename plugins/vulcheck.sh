#!/bin/bash
# AUTHOR NAME = SecureAxom (Mridupawan)
banner() {

    echo "
 ____  _____  ____  _  _  __ _____
/ ___\/__ __\/  __\/ \/ |/ //  __/
|    \  / \  |  \/|| ||   / |  \
\___ |  | |  |    /| ||   \ |  /_
\____/  \_/  \_/\_\\_/\_|\_\\____\

"
    
}

banner
if [ "$1" == "" ]; then
    echo "Usage: $0 IP : "
    exit
fi


respone=$(curl "https://internetdb.shodan.io/$1" -s)

# Bold COLORS
BBlack="\033[1;30m"  # Black
BRed="\033[0;31m"    # Red
BGreen="\033[1;32m"  # Green
BYellow="\033[1;33m" # Yellow
BBlue="\033[1;34m"   # Blue
BPurple="\033[1;35m" # Purple
BCyan="\033[1;36m"   # Cyan
BWhite="033[1;37m"   # White
NC="\033[0m"         #No Color
MCL="\033[01;37m>\033[01;32m"

cpes=$(echo $respone | jq ."cpes" -r | head -n 2 | tail -n 1 | sed 's/"/ /g' | column -t)
echo -e "$BYellow"cpes" "${BRed}$MCL" $BBlue $cpes"
hostnames=$(echo $respone | jq ."hostnames" -r | head -n 2 | tail -n 1 | sed 's/"/ /g' | column -t)
echo -e "$BYellow"hostnames" "$MCL" $BGreen $hostnames"
ip=$(echo $respone | jq ."ip" -r | sed 's/,/ /g')
echo -e "$BPurple"ip" "$MCL" $BBlue $ip"
ports=$(echo $respone | jq ."ports" -r | head -n 2 | tail -n 1 | column -t)
echo -e "$BYellow"ports" "$MCL" $BGreen $ports"
vuln=$(echo $respone | jq ."vulns" -r | sed 's/"/ /g' | sed -e 's/,/ /g' | tr -d '\n' | sed 's/   / /g' | column -t)
echo -e "$BCyan"vulns" "$MCL" $BRed $vuln"

