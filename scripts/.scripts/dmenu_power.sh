#!/bin/sh

case "$(echo "Shutdown\nRestart\nLogout\nSuspend\nLock" | dmenu -i -p "Power:" -l 5)" in
        Shutdown) exec systemctl poweroff;;
        Restart) exec systemctl reboot;;
        Logout) pkill dwm;;
        Suspend) exec systemctl suspend;;
	Lock) exec xsecurelock;;
esac
