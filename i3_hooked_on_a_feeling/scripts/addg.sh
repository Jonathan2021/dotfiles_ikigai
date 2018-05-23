#!/bin/bash
while read -r line;do
	git add "$line"
	git commit -m "23rd May : Create new scripts" 
done < <(git status --porcelain | awk '{print }' | awk -F'/' '{print $NF}')
echo "worked!!!!"
