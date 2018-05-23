#!/bin/bash
if [ $@ -eq 0 ];then
	wal -n -f ~/.colors/walschemes/molokaiDark.json	
	hsetroot -add "#F2994A" -add "#F2C94C" -gradient 0
	bash ~/dotfiles/scripts/bar & 
	xdo above -t 0x400063 "$(xdo id -a bar | head -n 1)"
	echo "dark" > ~/curtheme
else
	#wal -n -f ~/.colors/walschemes/solarizedLight.json	
	wal -l -i ~/Pictures/flowerDylan.jpg
	#hsetroot -add "#885EAD" -add "#513867" -gradient 0
	#bash ~/dotfiles/scripts/bar &
	xdo above -t 0x400063 "$(xdo id -a bar | tail -n 1)"
	echo "light" > ~/curtheme
fi
sleep 1
xdo lower -a bar
