# Use UTF-8 on the command line
export LC_CTYPE=en_US.UTF-8

# paths of boxen
[[ -f /opt/boxen/env.sh ]] && source /opt/boxen/env.sh

# Personal bins in dropbox and dotfiles
export PATH="$HOME/Dropbox/bin:$HOME/.bin:$PATH"

# Rustup and cargo bins path
export PATH="$HOME/.cargo/bin:$PATH"

# set up fzf autocompletion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
