# Init starship prompt for zsh
eval "$(starship init zsh)" 

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git 
  fzf-tab 
  zsh-autosuggestions 
  zsh-syntax-highlighting
  zsh-history-substring-search
  # fzf 
  extract
  # command-not-found
  # sudo
)

source $ZSH/oh-my-zsh.sh

# User configuration
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# * * * * * * * * * * * * * * * Bindings * * * * * * * * * * * * * * * * *

# Shift+Tab to accept auto suggest
bindkey '^[[Z' autosuggest-accept 

# * * * * * * * * * * * ENV Exports and configuration * * * * * * * * * * *

# Ignore commands that start with spaces and duplicates.
export HISTCONTROL=ignoreboth

# Don't add certain commands to the history file.
export HISTORY_IGNORE="(\&|[bf]g|c|clear|history|exit|q|fax|akshuly*|pwd|* --help)"

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# To remove folder highlighting
export LS_COLORS=""

# Set NVIM as manpage viewer (default less) 
export MANPAGER="nvim +Man!"

# bat-cli (cat clone) theme variable
export BAT_THEME="Catppuccin Mocha"

# To render fonts properly inside tmux
export LC_ALL=en_IN.UTF-8

# PATH appends
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"



# * * * * * * * * * * * * * * * Aliases * * * * * * * * * * * * * * * * *
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Custom Aliases
## QoL
alias open="xdg-open"
alias nv="nvim"
alias ff="clear; fastfetch"
alias ls="eza"
alias l="eza --icons -lah"
alias c="clear"
alias update="sudo pacman -Syuu"
alias cleanch="sudo pacman -Scc"
alias rmpkg="sudo pacman -Rsn"
alias cleanup="sudo pacman -Rsn $(pacman -Qtdq)" #  Cleanup orphaned packages
alias jctl="journalctl -p 3 -xb" # Get the error messages from journalctl
# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl" 

## FZF Utility aliases 
# add `-p` to bat command to disbale line numbers
alias fnv='selected=$(fzf -m --preview="bat --color=always --paging=always --pager=less -p {}"); [ -n "$selected" ] && nv "$selected"'
alias fpv='fzf --preview="bat --color=always --paging=always --pager=less -p {}"'
function frg {
    local pattern=$1

    rg --column --line-number --no-heading --color=always "$pattern" |
    fzf --ansi \
        --delimiter ':' \
        --preview "bat --style=numbers --color=always --highlight-line {2} {1}" \
        --preview-window "right:60%:+{2}/2" \
        --bind "enter:execute(nvim {1} +{2})"
}


## Fun
alias fax="clear; fortune | cowsay -f sus"
alias akshuly="cowsay -f actually"

## Adhoc aliases 
# to test different nvim configs
alias nv1='NVIM_APPNAME="nvown" nvim'
alias nv2='NVIM_APPNAME="testt" nvim'

# -----------------------------------------------------------------------------------------


# *** *** *** *** *** *** *** *** *** CLI Tool setup *** *** *** *** *** *** *** *** ***

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/satz/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/satz/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/satz/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/satz/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


## FZF Config
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
# zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

source <(fzf --zsh)

# Load secrets from .env if it exists
[ -f "$HOME/.env" ] && source "$HOME/.env"

# zoxide config and setup
eval "$(zoxide init zsh --cmd=c)"
