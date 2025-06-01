
# Terminal Art


# Load Completions



# Completions Styling



# Keybindings
bindkey -e 
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HISTDUPE=erase

# zsh Options



# Envs
export EDITOR=nvim
export DEFAULT_PLAYER=mpv
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland



# Aliases
alias f="yazi"
alias gc="git clone"
alias ls="lsd"
alias lsa="lsd -A"
alias v="nvim"
alias lg="lazygit"
alias ta="tmux attach"
alias zshconf="$EDITOR ~/.zshrc && source ~/.zshrc"


# Script


# Colorscheme -- Pywal16 --
(cat ~/.cache/wal/sequences &)
cat ~/.cache/wal/sequences
source ~/.cache/wal/colors-tty.sh 

# Shell Integrations
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"


# Plugins
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


