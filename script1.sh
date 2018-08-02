s#!/bin/bash

new_user=$1
password='root'
echo $password


sudo adduser --disabled-password --shell /bin/bash --home /home/$new_user --gecos "User" $new_user

sudo echo "$new_user:$password" | chpasswd


#sudo adduser --disabled-password --gecos "" $new_user 

#sudo echo $password | passwd $new_user

#sudo grep -i "$new_user" /etc/shadow | awk -F':' '{ print $2 }'


#sudo usermod -a -G sshusers $new_user

sudo su $new_user

