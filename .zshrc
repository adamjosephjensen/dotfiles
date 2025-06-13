alias push='git push'
alias vim='nvim'
alias ll='ls -la'
alias ytw='yarn test:watch'
alias yd='yarn dev'
alias cmc='git commit -m "minor changes"'
alias cdx='cd ~/Documents/xnay; pwd;'
alias ss='source ~/.zshrc'
alias nrc='nvim ~/.zshrc'
alias nlua='nvim ~/.config/nvim/init.lua'
alias nkitty='nvim ~/.config/kitty/kitty.conf'
alias ntmux='nvim ~/.tmux.conf'

autoload -Uz compinit && compinit

export TERM="xterm-kitty"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"


eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
