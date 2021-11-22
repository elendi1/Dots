autoload -U compinit && compinit
zmodload -i zsh/complist

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

#zstyle ':completion:*:*:*:default' menu yes select search 
zstyle ':completion:*:*:*:default' menu yes select interactive
