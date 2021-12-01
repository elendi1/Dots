# Use vi mode
bindkey -v
export KEYTIMEOUT=1

# Create a widger that executes the internal vi-yank widger and copies the zle clipboard to the X11 clipboard
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | xsel -ib
}

# Make that widget known to zle and bind it to y
zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip
