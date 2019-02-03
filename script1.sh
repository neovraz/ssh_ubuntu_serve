#!/bin/bash

new_user=$1
password='root'



#Checks if Openssh-server is installed. If not, installs the package.
bash "test.sh"



sudo systemctl start ssh


echo Password set to:$password


sudo adduser --disabled-password --shell /bin/bash --home /home/$new_user --gecos "User" $new_user

sudo echo "$new_user:$password" | chpasswd

echo "Password Changed"

#sudo systemctl status ssh
#To show ssh status remove '#'
