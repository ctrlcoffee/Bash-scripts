#!/bin/bash
#note that the apache service must be enabled to run this script!

if [[ $EUID -ne 0 ]]; then
    echo "you must be root user to run this script."
    sudo su
fi



cd /etc/apache2/sites-available > /dev/null
if [[ $? -ne 0 ]];then
    echo "Failed to change directory to /etc/apache2/sites-available"
    exit 1
fi



read -p "Enter the new Document Root path (/var/www/html/path)" new_docroot
if [ -z "$new_docroot" ]; then
    echo "No Document Root entered. Exiting."
    exit 1
fi



new_config_file="${new_docroot//\//-}.conf"
#default_conf="${000-default//\//}.conf"
cp 000-default.conf "$new_config_file"
echo "configuration file copied successfully..."

if [[ $? -ne 0 ]]; then 
    echo "Failed to create new config file ."
    exit 1
fi
echo "new config file created: $new_config_file ."


#edit Document Root directive
sed -i "s|DocumentRoot .*|DocumentRoot var/www/html/$new_docroot|g" "$new_config_file"


if [[ $? -ne 0 ]]; then 
    echo "Failed to update DocumentRoot in $new_config_file"
    exit 1
fi
echo "DocumentRoot directive edited successfully..."




#prompt for the domain (servername)
read -p "Enter the domain name for the servername (e.g., example.com)" server_name
if [ -z "$server_name" ]; then
    echo "No servername entered. Exiting."
    exit 1
fi
echo $new_config_file
ls -l "$new_config_file"

echo "Adding $server_name to $new_config_file"

sed -i "13i\\\tServerName $server_name" "$new_config_file"

echo "ServerName directive added successfully..."


  
echo "192.168.1.5 $server_name" | tee -a /etc/hosts > /dev/null
if [[ $? -ne 0 ]]; then 
    echo "Failed to add $server_name to /etc/hosts."
    exit 1
fi

cd /var/www/html/
if [[ $? -ne 0 ]]; then 
    echo "Failed to cd to /var/www/html"
    exit 1
fi

echo "virtual domain added to /etc/hosts successfully..."

mkdir "$new_docroot"
a2ensite "$new_config_file" &> /dev/null

systemctl reload apache2 

#restarting 
