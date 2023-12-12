export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="lambda"

HIST_STAMPS="dd.mm.yyyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
source $HOME/shell/paths
source $HOME/shell/aliases

export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
