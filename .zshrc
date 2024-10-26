# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
eval "$(starship init zsh)"


# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/


# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# now load zsh-syntax-highlighting plugin
alias  c='clear' # clear terminal
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias cd="z"
alias mkdir='mkdir -p'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
alias ta='tmux attach'


eval "$(zoxide init zsh)"
export BAT_THEME="Catppuccin Mocha"

# bun completions
[ -s "/home/aaisu/.bun/_bun" ] && source "/home/aaisu/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Created by `pipx` on 2024-08-25 15:41:31
export PATH="$PATH:/home/aaisu/.local/bin"
