#!/bin/bash
#Author : Mridupawan Bordoloi
#Date   : 15.1.2022

# Bold COLORS
BBlack="\033[1;30m"       # Black
BRed="\033[0;31m"         # Red
BGreen="\033[1;32m"       # Green
BYellow="\033[1;33m"      # Yellow
BBlue="\033[1;34m"        # Blue
BPurple="\033[1;35m"      # Purple
BCyan="\033[1;36m"        # Cyan
BWhite="033[1;37m"        # White
RESET="\033[00m"
NC="\033[0m"              #No Color
MCL="\033[01;37m>\033[01;32m";


banner(){
echo -e "$BRed"
echo "  ____  _  _  ____   ___  ____   __   _  _  __    ____  ____ " 
echo " / ___)/ )( \(  _ \ / __)(  _ \ / _\ / )( \(  )  (  __)(  _ \ "
echo " \___ \) \/ ( ) _ (( (__  )   //    \\ /\ // (_/\ ) _)  )   / "
echo " (____/\____/(____/ \___)(__\_)\_/\_/(_/\_)\____/(____)(__\_) "
echo ""
echo -e "$BGreen" "         Developed By Mridupawan | @SecureAxom"
echo ""
}

function animation(){


#printf "Loading ........."
#sleep 0.5
echo "Loading ................."
sleep 0.4
echo "Loading ............................."
sleep 0.5
}



banner
echo "Loading ........."
sleep 0.3
echo "Loading ............."
response0=$(curl -s  "https://api.hackertarget.com/hostsearch/?q=$1" | cut -d "," -f1 > fromhackertarget)
response1=$(curl -s "https://dns.bufferover.run/dns?q=$1"  | jq -r .FDNS_A[] | cut -d ',' -f2 | grep -w '$1' > fromdnsbufferover)
response2=$(curl -s "https://crt.sh/?q=$1" | grep  "TD" | awk '{print $1}' | sed  's/<TD>/ /g' | grep -w "$1" | sort -u | awk -F "<" '{print $1}' | column -t | uniq > fromcrt)
#response3=$(curl -s "https://api.threatminer.org/v2/domain.php?q=$1&rt=5" | jq -r .results[] > fromthreatminer)
animation
sleep 0.3
cat from* | sort -u | tee "output/subdomains.$1"
rm -rf from*
clear
cat "output/subdomains.$1"

#curl -s "https://rapiddns.io/subdomain/google.com?full=1#result" | grep -v "RapidDNS" | grep -v "<td><a" | cut -d '>' -f 2 | cut -d '<' -f 1 | grep "google.com" | grep -v "*" | sed -e 's/^[[:punct:]]//g' | sed -r '/^\s*$/d'
