starship init fish | source
set fish_greeting

set -gx $EDITOR windsurf
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

# Core Git commands
abbr -a g git
abbr -a gs 'git status'
abbr -a ga 'git add'
abbr -a gaa 'git add --all'
abbr -a gc 'git commit'
abbr -a gcm 'git commit -m'
abbr -a gca 'git commit --amend'

# Branch operations
abbr -a gb 'git branch'
abbr -a gco 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a gbd 'git branch -d'
abbr -a gbD 'git branch -D'

# Remote operations
abbr -a gf 'git fetch'
abbr -a gp 'git push'
abbr -a gpl 'git pull'
abbr -a gpf 'git push --force-with-lease'
abbr -a gps 'git push --set-upstream origin (git branch --show-current)'

# Log and diff
abbr -a gl 'git log'
abbr -a glo 'git log --oneline'
abbr -a glg 'git log --graph --oneline --decorate'
abbr -a gd 'git diff'
abbr -a gds 'git diff --staged'

# Stash operations
abbr -a gst 'git stash'
abbr -a gstp 'git stash pop'
abbr -a gstl 'git stash list'

# Reset and clean
abbr -a grh 'git reset HEAD'
abbr -a grhh 'git reset HEAD --hard'
abbr -a gclean 'git clean -fd'

# Merge and rebase
abbr -a gm 'git merge'
abbr -a grb 'git rebase'
abbr -a grbm 'git rebase main'

# LazyGit
abbr -a lg lazygit

# Tmux
abbr -a ta 'tmux attach'
abbr -a tad 'tmux attach -d'
abbr -a tls 'tmux ls'
abbr -a tn 'tmux new -s'

# Essential exa commands
abbr -a ls 'exa -l' # Long format
abbr -a lsa 'exa -la' # Long format with hidden files

# bun installation path and updating PATH
set -x BUN_INSTALL "$HOME/.bun"
set -x PATH $BUN_INSTALL/bin $PATH
