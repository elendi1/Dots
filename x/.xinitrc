# Keyboard Layout
setxkbmap it -option caps:escape &

# Swap Caps Lock and Escape
#setxkbmap -option caps:swapescape

# Display Resolution
xrandr -s 1920x1080 &

# Setting wallpaper
feh --bg-scale ~/Images/Wallpapers/default

# Compositor
picom -f &

# Launching dwm
exec dwm

