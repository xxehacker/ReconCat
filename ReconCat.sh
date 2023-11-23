#!/bin/bash

# Name : ReconCat :)
# Author : Secureaxom(mridupawan)
# Year : 2022


# colors
RESET="\033[00m"
BlueF='\e[1;34m'
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
nc="\e[0m"


#ROOT PRIVILEGIES
if [[ $EUID -ne 0 ]]; then
        echo -e "$red You don't have Root privilegies, execute the script as root.$nc"
        exit 1
fi

Version="V.1"
Instagram="Mridupawan503"
Twitter="xxehacker0x1"

logo() {

        echo""
        echo -e $red"     /. .\    "
        echo -e $RESET"  \_________/ $Cyan                  _________-----_____"
        echo -e $RESET"    } 6 6 {          _____------           __      ----_"
        echo -e $RESET"   =.  Y  ,=  __----             ___------              \ "
        echo -e $RESET"  .  /^^^\  .   ----________        ----                 \ "
        echo -e $RESET" (  /     \  )"$green" _____  ___  ___  ___  __  __"$red"  ___  ____ ____"
        echo -e $RESET"  \(  )-(  )/ "$green" ||_// ||_  ||   || || ||\ ||"$red" ||   ||__|| || "
        echo -e $RESET"    --   --   "$green" || \  ||__ ||__ ||_|| || \||"$red" ||__ ||  || || "
}

<<com
logo() {
echo -e "$red"
echo "      /. .\        "
echo "   \_________/     "
echo "     } 6 6 {       "
echo "    =.  Y  ,=      "
echo "      /^^^\  .     "
echo "     /     \  )    "
echo "    (  )-(  )/     "
echo "     ""   ""       "

}
echo -e $RESET" (  /     \  )  "$green"   ____ ____ ____ ____ _  _"$red" ____ ____ ___ "
echo -e $RESET"  \(  )-(  )/   "$green"   |__/ |___ |    |  | |\ |"$red" |    |__|  |  "
echo -e $RESET"    --   --     "$green"   |  \ |___ |___ |__| | \|"$red" |___ |  |  |  "
echo -e ""
com

banner() {
        clear
        logo
        echo -e "$yellow""    ------------------------------------------------ (o_o)"
        echo -e $Cafe" ||  ""ReconCat Created By  "$white": "$Cafe"Mridupawan             "$RESET" *"
        echo -e $Cafe" ||  ""Version              "$white": "$Cafe"$Version                    "$RESET" *"
        echo -e $Cafe" ||  ""Instagram            "$white": "$Cafe"$Instagram          "$RESET" *"
        echo -e $Cafe" ||  ""Follow me on Github  "$white": "$Cafe"@xxehacker            "$RESET" *"
        echo -e "$yellow""    ------------------------------------------------"
        echo ""
        echo -e "$Cafe Options :: $nc"
        echo ""
        echo -e "  $RESET ["$Cyan"01"$RESET"]  $red:$white Subdomain Enumeration$nc"    #subcrawler.sh
        echo -e "  $RESET ["$Cyan"02"$RESET"]  $red:$white Parameters Finding$nc"       #subcrawler + grep "="
        echo -e "  $RESET ["$Cyan"03"$RESET"]  $red:$white Banner Lookup$nc"            #bannerlookup.sh
        echo -e "  $RESET ["$Cyan"04"$RESET"]  $red:$white IP Info-Gathering$nc"        #ipinfo.sh
        echo -e "  $RESET ["$Cyan"05"$RESET"]  $red:$white Find Person Through Images"  #findperson.sh
        echo -e "  $RESET ["$Cyan"06"$RESET"]  $red:$white Vulnerability Scanning$nc"   #nmap vul
        echo -e "  $RESET ["$Cyan"07"$RESET"]  $red:$white Port Scanning$nc"            #nmap
        echo -e "  $RESET ["$Cyan"08"$RESET"]  $red:$white Wordpress Vuln Scanning$nc"  #wpscan
        echo -e "  $RESET ["$Cyan"09"$RESET"]  $red:$white Phone Number Information$nc" #phoneinfo.sh
        echo -e "  $RESET ["$Cyan"10"$RESET"]  $red:$white MD5 Decrypter"
        echo -e "  $RESET ["$Cyan"11"$RESET"]  $red:$white Techology Detect$nc"
        echo -e "  $RESET ["$Cyan"00"$RESET"]  $red:$white Exit"
        echo -e "  $Cafe"
        read -p " Choose ::  " exploit
        echo ""
}

exitfun() {

        echo -e "$RESET"
        echo ""
        read -p "[!] Do you want to exit? ( Yes / No ) ::: " check
        echo -e "$nc"
        if [ $check == "n" ] || [ $check == "N" ] || [ $check == "NO" ] || [ $check == "no" ]; then
                bash reconcat.sh
        elif [ $check == "y" ] || [ $check == "Y" ] || [ $check == "Y" ] || [ $check == "YES" ]; then
                sleep .30
                clear
                logo
                echo ""
                echo "                 Thank You For Using This Tool"
                echo ""
                exit
        else
                exit 1
        fi
}


#options

banner
if [ $exploit = 1 ] || [ $exploit == 01 ]; then
        echo ""
        echo -e "$red""|_________Subdomain Enumeration_________|$nc"
        echo -e "$green"
        echo -n " Enter Target Domain : "
        read domain
        echo ""
        bash plugins/subcrawler.sh $domain
        echo ""
        echo -e ""$Cyan"[+]"$RESET" Subdomain Enumeration Complete [$green✓$nc] "$Cyan"[+]"
        exitfun

        #options 2

elif [ $exploit = 2 ] || [ $exploit == 02 ]; then
        echo -e "                             $green"
        echo -n " Enter Domain : "
        read domain
        echo ""
        echo -e "$red |_________Finding Parameters_________| $nc"
        echo ""
        bash plugins/wayback.sh "$domain" | grep "=" | tee "output/params.$domain"
        echo ""
        echo -e "$red""Total hosts found: $(wc -l "output/params.$domain")"
        echo ""
        echo -e ""$Cyan"[+]"$RESET" Parameters Finding Complete $nc[$green✓$nc] "$Cyan"[+]"
        exitfun

#Options 3

elif [ $exploit = 3 ] || [ $exploit == 03 ]; then
        echo -e "$green"
        echo -n " Enter Target Ip (8.8.8.8) : "
        read bannerlookup
        echo ""
        echo -e "$red |_________Finding Website Banners_________| $nc"
        echo ""
        bash plugins/bannerlookup.sh $bannerlookup
        #echo -e "$red"
        echo -e ""$Cyan"[+]"$RESET"  Banner Finding Complete $nc[$green✓$nc] "$Cyan"[+]"
        exitfun
        

        #option 4

elif [ $exploit = 4 ] || [ $exploit == 04 ]; then
        echo -e "$green"
        echo -n " Enter Domain/IP : "
        read domip
        echo ""
        echo -e "$red |_________Finding IP Address Information_________| $nc"
        echo ""
        bash plugins/ipinfo.sh $domip
        echo ""
        echo -e "$red"
        echo -e ""$Cyan"[+]"$RESET" Ipinfo Finding Complete $nc[$green✓$nc] "$Cyan"[+]"
        exitfun

#Option 5

elif [ $exploit = 5 ] || [ $exploit == 05 ]; then
        echo -e "$green"
        # echo "You Should Put In One String (Example :- KevinMitnick)"
        echo -n " Name of the person : "
        read findperson
        echo ""
        echo -e "$red |_________Finding A Person Through Images_________| $nc"
        echo ""
        bash plugins/findperson.sh $findperson
        echo -e "$red"
        echo ""
        echo -e "$red"
        echo -e ""$Cyan"[+]"$RESET" Finding Complete $nc[$green✓$nc] "$Cyan"[+]"
        exitfun

        #Option 6

elif [ $exploit = 6 ] || [ $exploit == 06 ]; then
        echo -e "$green"
        echo -n " Enter Domain/IP : "
        read domip
        echo ""
        echo -e "$red |_________Finding Vulnerability_________| $nc"
        echo ""
        nmap -sV -T 3 -A -p- --script vulners $domip
        echo ""
        echo -e "$red"
        echo -e ""$Cyan"[+]"$RESET" Vulnerability Scanning Complete $nc[$green✓$nc] "$Cyan"[+]"
        exitfun

#option 7

elif [ $exploit = 7 ] || [ $exploit == 07 ]; then
        echo -ne "$green Enter Target Domain/Ip : "
        read port
        echo ""
        echo -e "$red |_________Finding Open Port And Services _________| $nc"
        echo ""
        nmap -sV -A -p- $port
        sleep 0.30
        echo ""
        echo -e "$red"
        echo -e ""$Cyan"[+]"$RESET" Port's Scanning Complete $nc[$green✓$nc] "$Cyan"[+]"
        exitfun

        #option 8

elif [ $exploit = 8 ] || [ $exploit == 08 ]; then
        echo -ne "$Cafe Enter Target Domain/Ip : "
        read wordpress
        echo ""
        echo -e "$red |_________Finding Wordpress Vulnerability_________| $nc"
        echo ""
        wpscan --url $wordpress
        sleep 0.30
        echo ""
        echo -e "$red"
        echo -e ""$Cyan"[+]"$RESET" Wordpress Scanning Complete $nc[$green✓$nc] "$Cyan"[+]"
        exitfun

#option 9

elif [ $exploit = 9 ] || [ $exploit == 09 ]; then
        echo -ne "$Cafe Enter Target Phone Number: "
        read number
        echo ""
        echo -e "$red |_________Finding Phone Number Information_________| $nc"
        echo ""
        bash plugins/phoneinfo.sh $number
        sleep 0.30
        echo ""
        echo -e "$red"
        echo -e ""$Cyan"[+]"$RESET" Phone Number Information Complete $nc[$green✓$nc] "$Cyan"[+]"
        exitfun

        #option 10

elif [ $exploit == 10 ]; then
        echo -ne "$Cafe What You Want To Decrypt(MD5): "
        read md5
        echo ""
        echo -e "$red |_________MD5 Decrypt_________| $nc"
        echo -e "$red"
        bash plugins/md5decrypter.sh $md5
        echo ""
        echo -e "$red"
        echo -e ""$Cyan"[+]"$RESET" Done $nc[$green✓$nc] "$Cyan"[+]"
        exitfun

# option 11

elif [ $exploit = 11 ]; then
        echo -ne "$Cafe Enter API Key : "
        read api
        echo ""
        echo -ne "$Cyan Enter Target Domain : "
        read domain
        echo ""
        echo -e "$Cafe  |_________Techonology Detector_________| $nc"
        echo -e "$green"
        bash plugins/cmsdetector.sh $api $domain
        echo ""
        echo ""
        echo -e ""$Cyan"[+]"$RESET" Done $nc[$green✓$nc] "$Cyan"[+]"
        exitfun

        # exit program
elif [ $exploit = 0 ] || [ $exploit == 00 ]; then
        echo -e "$red Program Exit ...$nc"
        sleep 0.25
        exit 1
else
        #echo ""
        echo -e $red " Invalid Input!, See You Next Time Dude "
        echo ""
        exit 1
fi
