#! /bin/bash
#Author : Arms
# it is a assignment for automate the whole subdomain enumeration when type one domain
#variables
day=$(date +%A)
#colours
red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
reset=`tput sgr0`
bold=`tput bold`


#Greetings
greetings()
{
echo -e "${red}${bold}Welcome $USER! Today is $day.\nYou are using $SHELL shell for script execution.${reset}"
}
dom=$1
read -p  "${red}${bold}Enter a domain : ${reset}" dom
# mkdir for dom
Directory()
{
mkdir "$dom"
touch $dom/subd.txt
touch $dom/alive.txt
touch $dom/sorted_subs.txt	
}
# Sub domain Recon #
sub_recon()
{
echo "${blue}${bold}Subdomains of $dom is Loading${reset}.............."
assetfinder -subs-only $dom > $dom/subd.txt
echo "${blue}${bold}Completed${reset}"

while read LINE; do
  curl -o /dev/null -siw "%{url_effective}: %{http_code}\n" "$LINE"
done < $dom/subd.txt

echo "${blue}${bold}Live Subdomains of $dom is Loading${reset}..............."
cat $dom/subd.txt | httprobe > $dom/alive.txt
echo "${blue}${bold}Completed${reset}"

# sorting subdomains
while read url ; do
	echo ${url#*//} >> urls.txt
done < $dom/subd.txt
sort -u urls.txt > $dom/sorted_subs.txt
count=$(cat $dom/sorted_subs.txt | wc -l)
rm urls.txt
}

# Main Script #

#if [[ -f '! ($pwd/subd)' ]]; then
#	echo "${red}${bold}Subdomains Not Found${reset}"
#else
greetings
Directory
sub_recon
echo "${red}${bold}Script Execution Completed${reset}"
echo "${blue}${bold}Total ${red}${bold} ${count} ${reset}${blue}${bold} subdomains found.${reset}"
#fi
