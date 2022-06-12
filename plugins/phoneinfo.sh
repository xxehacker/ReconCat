#!/bin/bash
#echo "PhoneInfo"
# AUTHOR NAME = Secureaxom (Mridupawan)
Version="V.1"
Instagram="Mridupawan503"
Twitter="SecureAxom"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
RESET="\033[00m"
white="\033[1;37m"
yellow="\033[1;33m"

#api="fcafcb7ea4a426d0988c8427f3798db1"
#64cf1a345da823a2ead87ddc6f9d28a5

banner() {

    echo "__________.__                         .___        _____        "
    echo "\______   \  |__   ____   ____   ____ |   | _____/ ____\____   "
    echo " |     ___/  |  \ /  _ \ /    \_/ __ \|   |/    \   __\/  _ \  "
    echo " |    |   |   Y  (  <_> )   |  \  ___/|   |   |  \  | (  <_> ) "
    echo " |____|   |___|  /\____/|___|  /\___  >___|___|  /__|  \____/  "
    echo "               \/            \/     \/         \/              "

    echo -e "$yellow""    ------------------------------------------------"
    echo -e $Cafe" ||  ""Created By           "$white": "$Cafe"Mridupawan (SecureAxom)"$red" *"
    echo -e $Cafe" ||  ""Version              "$white": "$Cafe"$Version                    "$red" *"
    echo -e $Cafe" ||  ""Instagram            "$white": "$Cafe"$Instagram          "$red" *"
    echo -e $Cafe" ||  ""Follow me on Github  "$white": "$Cafe"@Secureaxom            "$red" *"
    echo -e $Cafe" ||  ""Twitter              "$white": "$Cafe"$Twitter             "$red" *"
    echo -e "$yellow""    ------------------------------------------------"
    echo -e " $RESET"
    echo -e $Fiuscha""
}

banner
if [ "$1" == "" ]; then
    echo "Usage: $0 Number -- Exampe:- $0 9999999999"
    echo""
    exit
fi

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

respone=$(curl -sk "http://apilayer.net/api/validate?access_key=64cf1a345da823a2ead87ddc6f9d28a5&number=$1&country_code=IN&format=1")
status=$(echo $respone | jq '.valid' -r)

if [ $status == "true" ] 2>/dev/null; then

    echo ""
    #echo ""
    number=$(echo $respone | jq '.number' -r)
    echo -e "$BYellow Number" ${BRed}$MCL" $BGreen $number"
    country_code=$(echo $respone | jq '.country_code' -r)
    echo -e "$BYellow Country Code "$MCL" $BGreen $country_code"
    country_name=$(echo $respone | jq '.country_name' -r)
    echo -e "$BYellow Country Name "$MCL" $BGreen $country_name"
    location=$(echo $respone | jq -r '.location')
    echo -e "$BYellow Location "$MCL" $BGreen $location"
    carrier=$(echo $respone | jq -r '.carrier')
    echo -e "$BYellow Carrier "$MCL" $BGreen $carrier"
    echo ""

else
    printf "\e[0m\e[0;31m  Dude please give a valid phone number \e[0m\e[(0;31m\n\n"

fi
