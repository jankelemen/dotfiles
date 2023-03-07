//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"⌛ ", "date \"+%a %m-%d %I:%M %p\"",                                                                                                                 	 15,     7},
	{"🖲 ", "~/.scripts/touchpad.sh -i",															 0,      6},
	{"🧠 ", "free -m | awk 'NR==2 {printf \"%.1f\", $7/1000}' && echo GB",                                                                                 	 2,      8},
	{"📶 ", "nmcli -t -f NAME connection show --active",                                                                                                   	 2,      9},
	{"🔆 ", "printf \"%.0f%s\" \"$(light -G)\" %",                                                                                                         	 0,      1},
	{"🔋 ", "printf \"%s%s\" $([ $(cat /sys/class/power_supply/BAT*/status) != \"Discharging\" ] && echo 🔌) $(cat /sys/class/power_supply/BAT*/capacity)%", 55,     5},
	{"🔈 ", "pamixer --get-volume-human",                                                                                                                  	 3,      2},
	{"🎤 ", "amixer -D pulse sget Capture | awk -F\"[][]\" 'BEGIN { RS=\"\" } /Front Left/ { if ($4 == \"off\") { print \"muted\" } else { print $2 } }'", 	 3,      3},
	{"",    "xkblayout-state print %s",                                                                                                                    	 0,      4},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
