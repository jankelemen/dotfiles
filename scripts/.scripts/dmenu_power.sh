#!/bin/sh

case "$(echo "Shutdown\nRestart\nLogout\nSuspend\nLock" | dmenu -i -p "Power:" -l 5)" in
        Shutdown) systemctl poweroff;;
        Restart) systemctl reboot;;
        Logout) pkill dwm;;
        Suspend) systemctl suspend;;
	Lock) xsecurelock;;
esac
