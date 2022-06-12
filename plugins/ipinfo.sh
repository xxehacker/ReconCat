#!/bin/bash
# AUTHOR NAME = SecureAxom (Mridupawan)
banner() {

   clear
   printf "\e[0m\n"
   printf "\e[0;31m   _______             _     \e[0m\e[1;32m  _____       \e[0m\n"
   printf "\e[0;31m  |__   __|           | |    \e[0m\e[1;32m |_   _|      \e[0m\n"
   printf "\e[0;31m     | |_ __ __ _  ___| | __ \e[0m\e[1;32m   | |  _ __  \e[0m\n"
   printf "\e[0;31m     | |  __/ _  |/ __| |/ / \e[0m\e[1;32m   | | |  _ \ \e[0m\n"
   printf "\e[0;31m     | | | | (_| | (__|   <  \e[0m\e[1;32m  _| |_| |_) |\e[0m\n"
   printf "\e[0;31m     |_|_|  \__,_|\___|_|\_\ \e[0m\e[1;32m |_____| .__/ \e[0m\n"
   printf "\e[0;31m                                    | |    \e[0m\n"
   printf "\e[0;31m                                    |_|    \e[0m\n"
   printf "\e[0m\n"
   printf "\e[0m\e[0;31m       Created By Mridupawan Bordoloi     \e[0m\e[(0;31m\e[0m\n\n"
   printf "\e[0m\e[0;31m               @SECUREAXOM          \e[0m\e[(0;31m\n\n"

}

banner
if [ "$1" == "" ]; then
   echo "Usage: $0 IP : "
   exit
fi
#echo -n "Enter Your Attarget IP : "
#read $1
respone=$(curl http://ip-api.com/json/$1 -s)
#respone2=$(curl http://ipapi.co/$1/json/ -s)
status=$(echo $respone | jq '.status' -r)
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
#status2=$( echo $respone2 | jq '.version' -r)
if [ $status == "success" ] 2>/dev/null; then
   country=$(echo $respone | jq '.country' -r)
   echo -e "$BYellow COUNRTY "${BRed}$MCL" $BGreen $country"
   city=$(echo $respone | jq '.city' -r)
   echo -e "$BYellow CITY "$MCL" $BGreen $city"
   region=$(echo $respone | jq '.regionName' -r)
   echo -e "$BYellow REGION "$MCL" $BGreen $region"
   zip=$(echo $respone | jq '.zip' -r)
   echo -e "$BYellow PIN "$MCL" $BGreen $zip"
   timezone=$(echo $respone | jq '.timezone' -r)
   echo -e "$BYellow TIMEZONE "$MCL" $BGreen $timezone"
   isp=$(echo $respone | jq '.isp' -r)
   echo -e "$BYellow ISP "$MCL" $BGreen $isp"
   countryCode=$(echo $respone | jq '.countryCode' -r)
   echo -e "$BYellow COUNTRY_CODE "$MCL" $BGreen $countryCode"
   lat=$(echo $respone | jq '.lat' -r)
   echo -e "$BYellow LATITUDE "$MCL" $BGreen $lat"
   lon=$(echo $respone | jq '.lon' -r)
   echo -e "$BYellow LONGITUDE "$MCL" $BGreen $lon"
   org=$(echo $respone | jq '.org' -r)
   echo -e "$BYellow ORGANISATION "$MCL" $BGreen $org"
   as=$(echo $respone | jq '.as' -r)
   echo -e "$BYellow ASN "$MCL" $BGreen $as"
else
   printf "\e[0m\e[0;31m  Dude Please Give A Valid IP Address \e[0m\e[(0;31m\n\n"

fi
