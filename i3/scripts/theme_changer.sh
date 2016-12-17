#!/bin/bash
file="/home/kai/.Xresources_light"
if [ -f "$file" ]
then
	echo "$file found."
	file="/home/kai/.config/compton.config_light"
	if [ -f "$file" ]
	then
		echo "$file found."		
		file="/home/kai/.config/i3/i3.config_light"
		if [ -f "$file" ]
		then
		echo "$file found."
			file="/home/kai/.i3blocks.conf_light"
			if [ -f "$file" ]
			then
				echo "$file found."
				file="/home/kai/.gtkrc-2.0_light"
				if [ -f "$file" ]
				then
					echo "$file found."
					start="light"
				else
				echo "$file not found."
				fi
			else
			echo "$file not found."
			fi
		else
		echo "$file not found."
		fi
	else
	echo "$file not found."
	fi
else

file="/home/kai/.Xresources_dark"
if [ -f "$file" ]
then
	echo "$file found."
	file="/home/kai/.config/compton.config_dark"
	if [ -f "$file" ]
	then
		echo "$file found."		
		file="/home/kai/.config/i3/i3.config_dark"
		if [ -f "$file" ]
		then
		echo "$file found."
			file="/home/kai/.i3blocks.conf_dark"
			if [ -f "$file" ]
			then
			echo "$file found."
				file="/home/kai/.gtkrc-2.0_dark"
				if [ -f "$file" ]
				then
					echo "$file found."
					start="dark"
				else
				echo "$file not found."
				fi
			else
			echo "$file not found."
			fi
		else
		echo "$file not found."
		fi
	else
	echo "$file not found."
	fi
else
echo "$file not found."
fi

fi

if [ $start == "light" ]
then
mv /home/kai/.Xresources /home/kai/.Xresources_dark
mv /home/kai/.Xresources_light /home/kai/.Xresources
echo "Xresources -> $start"
mv /home/kai/.config/compton.conf /home/kai/.config/compton.config_dark
mv /home/kai/.config/compton.config_light /home/kai/.config/compton.conf
echo "Compton -> $start"
mv /home/kai/.config/i3/config /home/kai/.config/i3/i3.config_dark
mv /home/kai/.config/i3/i3.config_light /home/kai/.config/i3/config
echo "i3 -> $start"
mv /home/kai/.i3blocks.conf /home/kai/.i3blocks.conf_dark
mv /home/kai/.i3blocks.conf_light /home/kai/.i3blocks.conf
echo "i3Blocks -> $start"
mv /home/kai/.gtkrc-2.0 /home/kai/.gtkrc-2.0_dark
mv /home/kai/.gtkrc-2.0_light /home/kai/.gtkrc-2.0
echo "gtk -> $start"

xrdb ~/.Xresources
nitrogen --set-zoom-fill /home/kai/Bilder/19hepdG.jpg
i3-msg restart

mv /home/kai/.config/nitrogen/bg-saved.cfg /home/kai/.config/nitrogen/bg-saved.cfg_dark
mv /home/kai/.config/nitrogen/bg-saved.cfg_light /home/kai/.config/nitrogen/bg-saved.cfg
else
	if [ $start == "dark" ]
		then
		mv /home/kai/.Xresources /home/kai/.Xresources_light
		mv /home/kai/.Xresources_dark /home/kai/.Xresources
		echo "Xresources -> $start"
		mv /home/kai/.config/compton.conf /home/kai/.config/compton.config_light
		mv /home/kai/.config/compton.config_dark /home/kai/.config/compton.conf
		echo "Compton -> $start"
		mv /home/kai/.config/i3/config /home/kai/.config/i3/i3.config_light
		mv /home/kai/.config/i3/i3.config_dark /home/kai/.config/i3/config
		echo "i3 -> $start"
		mv /home/kai/.i3blocks.conf /home/kai/.i3blocks.conf_light
		mv /home/kai/.i3blocks.conf_dark /home/kai/.i3blocks.conf
		echo "i3Blocks -> $start"
		mv /home/kai/.gtkrc-2.0 /home/kai/.gtkrc-2.0_light
		mv /home/kai/.gtkrc-2.0_dark /home/kai/.gtkrc-2.0
		echo "gtk -> $start"

		xrdb ~/.Xresources
		nitrogen --set-zoom-fill /home/kai/Bilder/daft-dark_grey.png
		i3-msg restart
		mv /home/kai/.config/nitrogen/bg-saved.cfg /home/kai/.config/nitrogen/bg-saved.cfg_light
		mv /home/kai/.config/nitrogen/bg-saved.cfg_dark /home/kai/.config/nitrogen/bg-saved.cfg

	else
	echo "error"
	fi
fi
