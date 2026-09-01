#!/bin/bash 

cd /home/ypathan/scripts 

find . -type f | fuzzel --dmenu | while read -r file; do
	sh "$file" 2>&1 | fuzzel --dmenu
done


