#!/bin/bash
read -p "password: " passwd
if [ $passwd = pupa ] 
then
       echo "password is correct"       
else 
	exit 
fi	
echo "Who are you?"
sleep 1
read -p "Type: " x
if grep $x /etc/passwd
	then
		echo "That user is Exists"
		su $x
	else
	        sleep 1
        	read -p "Do you want to add new user?(y/n)" x1
        if [ $x1 = y ]
        then
		read -p "Use your entry name or create new? (entry/new) " x1
		if [ $x1 = entry ]
		then
			sudo useradd $x
			sleep 1
                	sudo passwd $x
		elif [ $x1 = new ]
		then
			read -p "Write your newname: " name
	 		sudo useradd $name
        		sleep 1
        		sudo passwd $name
		fi
        elif [ $x1 = n ]
	then
		exit
	fi
fi

