# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PYENV_ROOT=~/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
## Go 環境設定
if [ -x "`which go`" ]; then
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOPATH/bin
fi
eval "$(pyenv init -)"  # eval実行した文字列をコマンドとして実行
eval "$(pyenv virtualenv-init -)"  #ここが悪さしてる
# virtualenvでpromptを変更しない
export VIRTUAL_ENV_DISABLE_PROMPT=1
# zsh error https://github.com/robbyrussell/oh-my-zsh/issues/6835#issuecomment-390216875
ZSH_DISABLE_COMPFIX=true
# Path to your oh-my-zsh installation.
export ZSH="/Users/junya/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git ssh-agent ruby osx bundler brew rails emoji-clock zsh-autosuggestions zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh  # error occures here

# User configuration
#export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#
# zsh-completions setup
fpath=(/path/to/homebrew/share/zsh-completions $fpath)

autoload -U compinit
compinit -u
# japanesefile-showable
setopt print_eight_bit
# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# set aliases
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# !!!nospece before operator when you create alias!!!
alias e="emacs -nw"
alias p="python"


# The next line updates PATH for the Google Cloud SDK.
source "/Users/junya/Downloads/google-cloud-sdk/completion.zsh.inc"
# The next line enables bash completion for gcloud.
source "/Users/junya/Downloads/google-cloud-sdk/path.zsh.inc"
