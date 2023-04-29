import subprocess
import os

def main():
	key_layout()


def key_layout():
	# KEYBOARD LAYOUT
	selected = False
	while not selected:
		print("\nSELECT A KEYBOARD LAYOUT\n* Write 'list' to list available keyboard layouts\n* Write 'default' for uk keyboard")
		usr_kl = input("> ")
		if usr_kl == 'list': # List keyboards (ls /usr/share/kbd/keymaps/**/*.map.gz)
			os.system('localectl list-keymaps')
		elif usr_kl == 'default': # do nothing, it's already the default
			selected = True
			print('Keyboard succesfully set')
		else: # Try to set keyboard
			try:
				subprocess.run(['loadkeys', usr_kl], capture_output = True, check_output = True)
				selected = True
			# if error, key_layout again
			except:
				selected = False
			if selected:
				print('Keyboard succesfully set')
			else:
				print('Keyboard not set')

if __name__ == "__main__":
	main()
