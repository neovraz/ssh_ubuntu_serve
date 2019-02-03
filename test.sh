#!/bin/bash


script_path="install.sh"

bash "$script_path"
result=$?

echo "$result"

if [ $result = 0 ]; then
	echo "SSH already installed"
else
	sudo apt-get install openssh-server
fi
