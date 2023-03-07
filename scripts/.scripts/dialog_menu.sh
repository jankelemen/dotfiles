#!/bin/sh

launch() {
  "$@" > /dev/null 2>&1
}

intellij_projects() {
  case $(echo "Ssleek agent\nBaka\nSsleek web" | dmenu -i -p "Select:" -l 3) in
    "Ssleek agent")
      goland ~/bonet/sslwatch/ssleek-agent/agent ~/bonet/sslwatch/ssleek-agent/cli > /dev/null 2>&1 &;;
    "Baka")
      sudo systemctl start postgresql.service
      sudo systemctl start docker.service
      sudo systemctl start redis.service
      goland ~/school/baka/webserver ~/school/baka/webserver/web/frontend ~/school/baka/tester_api > /dev/null 2>&1 &;;
    "Ssleek web")
      sudo systemctl start postgresql.service
      sudo systemctl start docker.service
      docker run -d -it --rm --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3.10-management
      sudo systemctl start supervisord.service
      sudo systemctl start redis.service
      phpstorm ~/bonet/ssleek-web
  esac
}

case $(echo "Clear clipboard\nWifi menu\nRestart dwmblocks\nRestart network manager\nRestart sxhkd\nSetup 2 screens\nSetup 1 screen\nIntellij projects\nTimetable" | dmenu -i -p "Select:" -l 100) in
  "Clear clipboard")
    pkill greenclip && greenclip clear && greenclip daemon &;;
  "Wifi menu")
    "$TERMINAL" -e nmtui;;
  "Restart dwmblocks")
    killall dwmblocks && dwmblocks &;;          
  "Restart network manager")
    sudo systemctl restart NetworkManager.service;;          
  "Restart sxhkd")
    pkill -USR1 -x sxhkd;;          
  "Setup 2 screens")
    [ $(xrandr --query | grep -c ' connected') = 2 ] && xrandr --output eDP --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-0 --off --set TearFree on && nitrogen --restore && ~/.scripts/touchpad.sh && pkill -RTMIN+6 dwmblocks;;
  "Setup 1 screen")
    xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off && nitrogen --restore && ~/.scripts/touchpad.sh && pkill -RTMIN+6 dwmblocks;;
  "Intellij projects")
    intellij_projects;;
  "Timetable")
    nomacs ~/pix/rozvrh_leto_2022.png &;;
esac
