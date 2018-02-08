#!/bin/bash

ans=$(zenity  --list  --text "Fehlermeldungen (Apport Error Reports)" --radiolist  --column " " --column "Auswahl" TRUE "Deaktivieren (Disable)" FALSE "Aktivieren (Enable)");

case $ans in
    1)
	exit
	;;
    -1)
	exit
	;;
esac

case $ans in
	"Deaktivieren (Disable)")
		pkexec sed s/enabled=1/enabled=0/g /etc/default/apport -i
		;;
esac
case $ans in
	"Aktivieren (Enable)")
		pkexec sed s/enabled=0/enabled=1/g /etc/default/apport -i
		;;
esac

zenity --info
