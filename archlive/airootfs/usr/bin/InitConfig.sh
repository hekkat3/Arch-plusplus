function key_layout() {
    k_selected=false
    while [ $k_selected = false ]
    do
        echo "SELECT A KEYBOARD LAYOUT"
        echo "* Write 'list' to list available keyboard layouts"
        echo "* Write 'default' for uk keyboard"
        read -p "> " selection
        if [ $selection = "list" ] ; then
            localectl list-keymaps
        elif [ $selection = "default" ]; then
            k_selected=true
        else
            localectl set-keymap --no-convert $selection
            setxkbmap -layout $selection
            

    done

}

key_layout
#timezone
#wifi
#last_print