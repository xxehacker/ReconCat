#install requirements

#ROOT PRIVILEGIES
sudo apt-get update
sudo chmod +x ReconCat.sh
mkdir output
echo -e "Installing all dependencies\n"
echo ""
echo -e "Installing git"
sudo apt-get install git -y 2> /dev/null &> /dev/null
sudo apt-get install curl -y 2> /dev/null &> /dev/null
sudo apt-get install nmap -y 2> /dev/null &> /dev/null
sudo apt-get install wpscan -y 2> /dev/null &> /dev/null
echo  "Installing jq"
sudo apt install jq -y 2> /dev/null &> /dev/null


