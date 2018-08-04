#!/bin/bash

new_user=$1
password='root'
echo $password


sudo adduser --disabled-password --shell /bin/bash --home /home/$new_user --gecos "User" $new_user

sudo echo "$new_user:$password" | chpasswd


sudo su $new_user

