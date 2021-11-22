# Use fd instead of the default find for fzf '**' shell completions
# The first argument to the function ($1) is the base path to start traversal
_fzf_compgen_path() {
  command fd --hidden --follow --exclude .git --exclude node_modules . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  command fd --type d --hidden --follow --exclude .git --exclude node_modules . "$1"
}

# Import fzf key bindings
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --exclude node_modules"

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Default FZF options
#export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80% --preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"

# Use fd also for ALT-C command
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git --exclude node_modules'

export FZF_ALT_C_OPTS=''

