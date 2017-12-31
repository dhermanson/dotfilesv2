export CLICOLOR=1
# check if osx or linux
if [[ `uname` == 'Linux' ]]
then
        export LINUX=1
        export GNU_USERLAND=1
else
        export LINUX=
fi

if [[ `uname` == 'Darwin' ]]
then
        export OSX=1
else
        export OSX=
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="juanghurtado"

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
DISABLE_AUTO_TITLE="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker docker-compose git gulp httpie jsontools laravel5 lein rake rsync tmux)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

################################################################################

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-twilight.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-chalk.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-apathy.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-ashes.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-grayscale.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-mocha.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-solarized.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# MPD daemon start (if no other user instance exists)
# [ ! -s ~/.config/mpd/pid ] && mpd ~/.config/mpd/mpd.conf 2> /dev/null


##############i started x'ing stuff here########################################
#
# gruvbox
# source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
source "$HOME/.local/share/nvim/plugged/gruvbox/gruvbox_256palette_osx.sh"

# python pip
alias pip="pip2"

# tmux
alias tmux="tmux -2"

# use rbenv for ruby
export RBENV_VERSION="2.4.0"
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# # curl
# export PATH="/usr/local/opt/curl/bin:$PATH"


## adjust path to prefer homebrew
#export PATH=/usr/local/bin:$PATH
#export PATH=/usr/local/sbin:$PATH
#export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
#
#
#source ~/.repositories/github/dhermanson/dotfiles/zsh/aliases.sh
##alias vim="mvim -v"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias n="nvim"
alias nv="nvim"
alias nvi="nvim"

# alias phpstan='docker run -v $PWD:/app --rm phpstan/phpstan'
#
#alias xon='export XDEBUG_CONFIG="idekey=PHPSTORM"'
#alias xoff='export XDEBUG_CONFIG=""'
#
## run rake tasks without escaping brackets
#alias rake='noglob rake'
#
## alis for cmus to dump errors to /dev/null
#alias cmus="cmus 2> /dev/null"
#
## alias for homestead
#alias vm="ssh vagrant@127.0.0.1 -p 2222"
#
## alias to go to dotfiles directory
#alias dotfiles="pushd . && cd /Users/derick/.repositories/github/dhermanson/dotfiles"
#
## use new features in node
##alias node="node --harmony_modules --harmony_tailcalls"
#
## homebrew api token
#if [[ -f ./.homebrew_github_api_token ]]; then
#  export HOMEBREW_GITHUB_API_TOKEN=$(cat ./.homebrew_github_api_token)
#fi
#
# node version manager settings
# export MY_NVM_VERSION="v8.9.1"
# export NVM_DIR=~/.nvm
# [ -s ~/.nvm/nvm.sh ] && . ~/.nvm/nvm.sh # This loads nvm
#
## setup homebrew golang
#export GOPATH=$HOME/workspace/golang
#export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:$GOROOT/bin
#
# add local node_modules bin to path
export PATH=$PATH:./node_modules/.bin
# add local composer bin to path
export PATH=$PATH:./vendor/bin
# add global composer to path
export PATH=$PATH:~/.composer/vendor/bin
## add cabal bin to path
#export PATH=$PATH:~/.cabal/bin
## add stack binary path to bin
#export PATH=$PATH:~/.local/bin
# add latex binaries
if [[ "$OSX" == "1" ]]
then
  # export PATH=$PATH:/usr/local/texlive/2016/bin/universal-darwin
  export PATH=$PATH:/Library/TeX/texbin
  export PATH=/usr/local/opt/llvm/bin:$PATH
fi
#
## docker stuff
#export DOCKER_HOST=tcp://192.168.99.100:2376
##export DOCKER_CERT_PATH=/Users/derick/.docker/machine/machines/default
#export DOCKER_CERT_PATH="${HOME}/.docker/machine/machines/default"
#export DOCKER_TLS_VERIFY=1
#
#
## i think this helps me use keys like <C-s> in terminal vim
#stty -ixon -ixoff
#
#################################################################################
#
#export FZF_DEFAULT_COMMAND='ag --hidden -l -i -f --skip-vcs-ignores'
# export FZF_DEFAULT_OPTS='
#   --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
#   --color info:150,prompt:110,spinner:150,pointer:167,marker:174
# '
# export FZF_DEFAULT_OPTS='
#   --color fg:240,bg:230,hl:33,fg+:241,bg+:221,hl+:33
#   --color info:33,prompt:33,pointer:166,marker:166,spinner:33
# '

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# add bin to path
export PATH=~/bin:$PATH

##############i stopped x'ing stuff here########################################


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/derickhermanson/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/derickhermanson/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/derickhermanson/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/derickhermanson/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

