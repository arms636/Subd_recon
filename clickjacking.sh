#! /bin/bash
#Author : Arms
dom=$1
url=$dom
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

mkdir clickjacking


Click_jack()
{
echo "
		<html>
        <head>
        <title>Clickjack test page</title>
        </head>
        <body>
        <p>Website is vulnerable to clickjacking!</p>
        <iframe src="$url" width="500" height="500"></iframe>
        <p>if you can see the webpage inside tha box then it is vulnerable to clickjacking.</p>
        </body>
        </html>
" > clickjacking/clickjack.html
}
 
find_out()
{
firefox clickjacking/clickjack.html
}

greetings
read -p "${blue} Enter a URL : ${reset}" dom
Click_jack
find_out