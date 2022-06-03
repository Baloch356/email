#!/bin/bash

##### Colors Used #####

Red="\e[1;91m"

Green="\e[1;92m"

Yellow="\e[1;93m"

White="\e[1;97m"

##### Banner #####

banner () { clear

echo -e "${Red} 
 ▄▄▄▄▄▄▄▄▄▄▄  ▄            ▄▄▄▄▄▄▄▄▄▄▄      
${White}▐░░░░░░░░░░░▌▐░▌          ▐░░░░░░░░░░░▌     
${Red}▐░█▀▀▀▀▀▀▀█░▌▐░▌           ▀▀▀▀█░█▀▀▀▀      
${White}▐░▌       ▐░▌▐░▌               ▐░▌          
${Red}▐░█▄▄▄▄▄▄▄█░▌▐░▌               ▐░▌          
${White}▐░░░░░░░░░░░▌▐░▌               ▐░▌          
${Red}▐░█▀▀▀▀▀▀▀█░▌▐░▌               ▐░▌          
${White}▐░▌       ▐░▌▐░▌               ▐░▌          
${Red}▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄  ▄▄▄▄█░█▄▄▄▄      
${White}▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     
 ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀      
                                          
 +-+-+-+-+-+-+ 
 \e[92m|B|a|l|o|c|h| 
 +-+-+-+-+-+-+ 
                 

${White}     HELO! Create Unlimited Gmails  \n

      \e[0;96mDeveloped by: \e[93m Ali baloch & Ahmad & Uzair\n\n"
      
 echo -e "\e[1m\e[35m¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥\e[21m"

echo " "
echo -e "\e[93m\e[92mBy Clicking Enter you agree that"
echo -e "\e[93mTHIS TOOL IS USING ONLY FOR     "
echo -e "\e[92m   EDUCATIONAL PURPOSE          "
echo -e "\e[91m"
echo -e "\e[1m\e[91m××××××××××××××××××××××××××××××××××××××××××××\e[21m"

}

email () {

##### Input Email, validation based on regular expression #####

read -p $'\e[1;97m[\e[1;92m*\e[1;97m]\e[1;92m Enter email address : \e[1;97m' email

if [[ $email =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]; then

read -p $'\e[1;97m[\e[1;92m*\e[1;97m]\e[1;92m Number of mails to generate : \e[1;97m' number

##### Extracting name and domain from email #####

name=`echo $email | cut -d "@" -f 1`

domain=`echo $email | cut -d "@" -f 2`

echo -e "$White[${Red}!$White]$Red Generating :${White}\e[0;97m"

sleep 1

##### Email Generating #####

echo "import sys

def generator(name): 

 return [name] + [name[:i]+\".\"+right for i in range(1,len(name)) for right in generator(name[i:]) ]

for result in generator(sys.argv[1]):

 print(result)

" > temp.py

if [ $(($number / 2)) -gt $((2**(${#name} - 1))) ]; then

alias_number="$(( $number - (2**(${#name} - 1)) ))"

else

alias_number="$(($number / 2 ))"

fi

python3 temp.py $name > generated

rm temp.py

if [ $((number%2)) -eq 0 ]; then 

shuf -n $(( number / 2 )) generated > display

else

shuf -n $((( number / 2 ) + 1 )) generated > display

fi

rm generated

awk '$0=$0"@'$domain'"' display	> temp.lstrm display

shuf -n $alias_number alias > names

awk '$0="'$name'+"$0"@'$domain'"' names  >> temp.txt

rm names

shuf temp.txt > $name.txt

rm temp.txt

cat $name.txt

trap "rm $name.txt &> /dev/null" EXIT

##### Save the generated sdcard #####

read -p $'\n\e[1;97m[\e[1;92m*\e[1;97m]\e[1;92m Do you want to save the sdcard (y/n) : \e[1;97m' save_sdcard

if [ "$save_sdcard" = "Y" ] || [ "$save_sdcard" = "y" ]; then

##### Check if output directory exists #####

if [ ! -d "/sdcard" ]; then

mkdir sdcard 

fi

cp $name.txt sdcard 

echo -e "$White[${Yellow}*$White]$Yellow sdcard saved at : ${White}/sdcard/$name.txt"

echo -e "$White[${Red}!$White]$Red Exiting...\n"; exit

else 

rm $name.txt

echo -e "$White[${Red}!$White]$Red Exiting...\n"; exit

fi

else

echo -e "$White[${Red}!$White]$Red Invalid email address"

email 

fi

}

banner

email
