#" This is a mini-project challenge accepted by neovraz"
#" Date:28/07/2018				       "
#" The job is to make an ssh based automation to access"
#" 5 remote Ubuntu systems			       "
#" Please run this script only on the client side. On s"
#" ever side to create a user account run script1.sh wi"
#" th username as a parameter.                         "
#" eg:- sudo sh script1.sh New-Username		       "
#" here New-Username is the name of user	       "

#!/bin/bash


#Script flags:
logged_in=0
entered=0
num=0;
count=0;
not_exit=1;




#This is to execute first time to generate key
first_time()
{
echo "key generation is recommended";
echo "Generating......";
ssh-keygen -t rsa -b 2048;
ssh-copy-id $un@$ip;
}

log()
{

un=$1
ip=$2

echo "ssh $un@$ip";
ssh $un@$ip

}

custom_command()
{


c_exit=1;

while [ $c_exit = 1 ];
do
{
echo "Enter your custom command. Type 'exit' to close"
read c_command
if [ $c_command = 'exit' ]
then
{
c_exit=0;
}
else
{
$c_command;
}
fi
} 
done



}

get_ip()
{

echo "enter your user name:"
read un

echo "Enter server ip"
read ip

echo "$ip">server.txt
echo "Do you want to connect to given ip? y/n"
read choice

if [ $choice = 'y' ]
then
{
logged_in=1
log $un $ip
}

fi
}




menu()
{



while [ $not_exit = 1 ];
do
{
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"
echo "1.Select server/enter credentials."
echo "2.Connect to selected servers."
echo "3.Generate keys (first timers only)."
echo "4.Custom command."
echo "5.Exit."
echo "+++++++++++++++++++++++++++++++++++++++++++++++++"

read mchoice

if [ $mchoice = 1 ]
then
{
entered=1
get_ip
}
elif [ $mchoice = 2 ]
then
{
if [ $entered -ne 1 ]
then
{
get_ip
}
fi
if [ $logged_in -eq 0 ]
then
{
log $un $ip;
}
fi
}
elif [ $mchoice = 3 ]
then
{
if [ $entered -ne 1 ]
then
{
get_ip
}
fi
first_time;
}
elif [ $mchoice = 4 ]
then
{ 
custom_command;
}
elif [ $mchoice = 5 ]
then
{ 
not_exit=0; 
}
else 
{
echo "Please enter correct option ";
}

fi
} done
}

menu


