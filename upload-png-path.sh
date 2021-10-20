#! /bin/bash

export host="";
export username="";
export password="";
#export red_color="\033[0;31m";
#export default_color="\033[0m";
export unix_time=$(date +%s);

#echo "Enter File Name:";
#read file_name;
#
#if [ ! -f $file_name ]; then 
#	echo -e "${red_color}File Not Found ${default_color}";
#	exit;
#fi

export new_file_name="${unix_time}.png";
find . -iname '*png' -type f -exec mv "{}" $new_file_name \;
curl "ftp://${host}/wp-content/uploads/mohrez/" --user "${username}:${password}" -T $new_file_name -v;
echo "https://${host}/wp-content/uploads/mohrez/${new_file_name}" | xclip -sel clip;
