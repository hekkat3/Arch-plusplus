systemctl enable NetworkManager.service &
nm-applet &
feh --bg-scale "/root/background.jpg" --no-fehbg &
exec i3
