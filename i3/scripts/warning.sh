#!/bin/bash

#!/bin/bash
ac=`acpi -a | awk '{print $3}' | tr -d ,`
status=`acpi -b | awk '{print $3}' | tr -d ,` 
percent=`acpi -b | acpi -b | awk '{print $4}' | cut -d % -f 1`
remaining=`acpi -b | awk '{print $5}' | cut -d : -f 1,2`

if [ $ac == "on-line" ]
then
echo "";	
else
	if [ $percent -lt 15 ]
	then 
	DISPLAY=:0.0 DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" /usr/bin/notify-send -u critical -t 5000 "       Battery is low!" " $percent %    $remaining remaining";
	
        fi 
fi



