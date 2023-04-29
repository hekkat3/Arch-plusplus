function key_layout() {
	k_selected=false
	while [ $k_selected = false ]
	do
		echo "SELECT A KEYBOARD LAYOUT"
		echo "* Write 'list' to list available keyboard layouts"
		echo "* Write 'default' for uk keyboard"
		read -p "> " usr_k
		if [ $usr_k = "list" ] ; then
			localectl list-keymaps
		elif [ $usr_k = "default" ]; then
			k_selected=true
		else
			if localectl set-keymap --no-convert $usr_k && setxkbmap -layout $usr_k ; then
				k_selected=true
			fi
		fi
		if [ $k_selected=true ] ; then
			echo "Keyboard succesfully set"
		else
			echo "There's been an issue. Try again"
		fi
	done
}
function timezone() {
	t_selected=false
	while [ $t_selected = false ]
	do
		echo "SELECT A TIMEZONE"
		echo "* Write 'list' to list available timezones"
		read -p "> " usr_t
		if [ $usr_t = "list" ] ; then
			timedatectl list-timezones
		else
		 	if timedatectl set-timezone $usr_t ; then
				t_selected=true
			fi
		fi
		if [ $t_selected=true ] ; then
			echo "Timezone succesfully set"
		else
			echo "There's been an issue. Try again"
		fi
	done
}
function last_print() {
	echo ""
	echo ""
	echo ""
	echo ""
	echo "INITIAL CONFIGURATION COMPLETED"
	echo "If you need to make any changes:"
	echo ""
	echo "* KEYBOARD SETUP"
	echo "- Use 'man xkeyboard-config' to get all the information you need"
	echo "- Use 'setxkbmap -layout {desired layout}' to change it"
	echo ""
	echo "* TIMEZONE SETUP"
	echo "- Use 'timedatectl list-timezones' to see available timexones"
	echo "- Use 'timedatectl set-time {yyy-MM-dd hh:mm:ss}' to set the time manually"
	echo "- Use 'timedatectl set-timezone {Z/SZ}' to change the timezone"
	echo ""
	echo "* WIFI SETUP"
	echo "- If you want to use Ethernet, just plug it in"
	echo "- If you want to use Wifi, use 'iwctl'. After entering the [iwd]# prompt, use 'help' to see all the information you need"
	echo "- If you want to use Mobile Network, use 'mmcli. Use 'man mmcli to see all the information you need'"
	echo ""
	echo "One last thing:"
	echo "The i3 configuration file is '~/.config/i3/config', go to this file with 'vim ~/.config/i3/config' and remove the last line. Make any other change you want to do in the configuration file and read the shortcuts currently set"
	read -p "Press enter to continue" nothing
}

key_layout
timezone
last_print
