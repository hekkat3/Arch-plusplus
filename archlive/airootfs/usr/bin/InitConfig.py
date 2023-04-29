import subprocess
import os

def main():
	key_layout()
	timezone()
	wifi()
	last_print()

def key_layout():
	# KEYBOARD LAYOUT
	k_selected = False
	while not k_selected:
		print("\nSELECT A KEYBOARD LAYOUT\n* Write 'list' to list available keyboard layouts\n* Write 'default' for uk keyboard")
		usr_kl = input("> ")
		if usr_kl == 'list': # List keyboards (ls /usr/share/kbd/keymaps/**/*.map.gz)
			os.system('localectl list-keymaps')
		elif usr_kl == 'default': # do nothing, it's already the default
			k_selected = True
		else: # Try to set keyboard
			cmd1 = "localectl set-keymap --no-convert " + usr_kl
			cmd2 = "setxkbmap -layout " + usr_kl
			os.system(cmd1)
			os.system(cmd2)
			k_selected = True

def timezone():
	# TIMEZONE SELECTION
	t_selected = False
	while not t_selected:
		print("\nSELECT A TIMEZONE\n* Write 'list' to list available timezones")
		usr_t = input("> ")
		if usr_t == 'list': # List timezones (timedatectl list-timezones)
			os.system('timedatectl list-timezones')
		else: # Try to set timezone
			try:
				subprocess.run(['timedatectl set-timezone', usr_t],capture_output = True, check_output = True)
				t_selected = True
			except:
				t_selected = False
			if t_selected:
				print("Timezone succesfully set")
			else:
				print("Timezone not set, try again")

def wifi():
	connected = False
	want_to_connect = True
	# Check if there is a connection
	if connected:
		return
	# Ask if a connection is wanted
	answered = False
	while not answered:
		answ = input("Do you want to connect through Wifi? (y/n)").lower()
		if answ == 'y' or 'yes':
			answered = True
		elif answ == 'n' or 'no':
			want_to_connect = False
			answered = True
	if not want_to_connect:
		return
	while not connected:
		connected = True
		# Display available connections
		# Try to connect
		# Repeat (2.) if not connected

def last_print():
	print("Initial setting completed")
	print("If you need to make any changes:")
	print("* KEYBOARD SETUP")
	print("- Use 'man xkeyboard-config' to get all the information you need")
	print("- Use 'setxkbmap -layout {desired layout}' to change it")
	print("* TIMEZONE SETUP")
	print("- Use 'timedatectl list-timezones' to see available timexones")
	print("- Use 'timedatectl set-time {yyy-MM-dd hh:mm:ss}' to set the time manually")
	print("- Use 'timedatectl set-timezone {Z/SZ}' to change the timezone")
	print("* WIFI SETUP")
	print("- If you want to use Ethernet just plug it in")
	print("- If you want to use Wifi, use 'iwctl'. After entering the [iwd]# prompt, use 'help' to see all the information you need")
	print("- If you want to use Mobile Network use 'mmcli. Use 'man mmcli to see all the information you need'")
	print("")
	print("One last thing:")
	print("The i3 configuration file is '~/.config/i3/config', go to this file with 'vim ~/.config/i3/config' and remove the last line. Make any other change you want to do in the configuration file and read the shortcuts currently set")
	input("Press any key to continue")

if __name__ == "__main__":
	main()
