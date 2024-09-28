# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

# Theme settings
ZSH_THEME="powerlevel10k/powerlevel10k"

# Powerlevel10k configurations
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_NODE_VERSION_BACKGROUND='022'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="#bd93f9"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_CONTEXT_TEMPLATE="%n"

# Plugins
plugins=(
  git
  npm
  docker
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Aliases
alias python=python3
alias python2=python2
alias vim="nvim"
alias nvimconfig="nvim ~/.config/nvim"

# Path settings
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/python@3.7/bin:$PATH"
export PATH="/usr/local/opt/python@3.9/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export DOTNET_ROOT=$HOME/.dotnet
export GOPATH="$HOME/.local/share/go"
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools
export PATH=$HOME/.local/bin:$PATH

# bun setup and completions
if [ -s "$HOME/.bun/_bun" ]; then
  source "$HOME/.bun/_bun"
fi
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Add local bin to PATH for all users
export PATH="$PATH:$HOME/.local/bin"

