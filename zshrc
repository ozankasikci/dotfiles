# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
plugins=(git)

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH="$HOME/.node/bin:$PATH"
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

#{{{ History Stuff

## Where it gets saved
HISTFILE=~/.history

## Remember about a years worth of history (AWESOME)
SAVEHIST=10000
HISTSIZE=10000

## Don't overwrite, append!
setopt APPEND_HISTORY

## Write after each command
setopt INC_APPEND_HISTORY

## Killer: share history between multiple shells
setopt SHARE_HISTORY

## If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

## Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

## Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

## If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

## When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

## Save the time and how long a command ran
setopt EXTENDED_HISTORY

setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

##}}}

#{{{ Prompt!

host_color=cyan
history_color=yellow
user_color=green
root_color=red
directory_color=magenta
error_color=red
jobs_color=green

host_prompt="%{$fg_bold[$host_color]%}%m%{$reset_color%}"

jobs_prompt1="%{$fg_bold[$jobs_color]%}(%{$reset_color%}"

jobs_prompt2="%{$fg[$jobs_color]%}%j%{$reset_color%}"

jobs_prompt3="%{$fg_bold[$jobs_color]%})%{$reset_color%}"

jobs_total="%(1j.${jobs_prompt1}${jobs_prompt2}${jobs_prompt3} .)"

history_prompt1="%{$fg_bold[$history_color]%}[%{$reset_color%}"

history_prompt2="%{$fg[$history_color]%}%h%{$reset_color%}"

history_prompt3="%{$fg_bold[$history_color]%}]%{$reset_color%}"

history_total="${history_prompt1}${history_prompt2}${history_prompt3}"

error_prompt1="%{$fg_bold[$error_color]%}<%{$reset_color%}"

error_prompt2="%{$fg[$error_color]%}%?%{$reset_color%}"

error_prompt3="%{$fg_bold[$error_color]%}>%{$reset_color%}"

error_total="%(?..${error_prompt1}${error_prompt2}${error_prompt3} )"

#}}}

# Enables cd into dir, just by typing dir name.
setopt AUTO_CD

# 10 second wait if you do something that will delete everything.
setopt RM_STAR_WAIT

#{{{ Functions!

#appends an alias to the bashrc file
function addAlias() {
    echo "alias $1='$2'" >>  ~/.zshrc #or .bashrc
}

#opens bitbucket page
function obb() {
    giturl=$(git config --get remote.origin.url)
    if [ "$giturl" = "" ]
        then
            echo "Not a git repository or no remote.origin.url set";
            return;
    fi

    if [ "$1" = "repo" ]
        then
            target=""

    elif [ "$1" = "pr" ]
        then
            target="pull-requests"

    elif [ "$1" = "branch" ]
        then
            target="branch/$(git symbolic-ref HEAD 2>/dev/null)" ||
            target="(unnamed branch)" #detached HEAD
            target=${target/refs\/heads\//""}

    elif [ "$1" = "branches" ]
        then
            target="branches"

    elif [ "$1" = "cpr" ]
        then
            target="pull-request/new"

    else
        echo "  Usage:
        obb repo    (for repo) \n
        obb cpr     (for creation pull request) \n
        obb pr      (for pull requests page) \n
        obb branch  (for branch) \n
        obb branches (for branches)"
        return;
    fi

    replacement='https://bitbucket.org/';
    match='git@bitbucket.org:'
    giturl=${giturl/$match/$replacement}
    giturl=$giturl/$target

    open $giturl
}


# vim related stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vimfzf='vim $(fzf)'

# tmux related stuff
alias tmux="tmux -2"
alias ta='tmux a -t'
alias tls='tmux ls'

# vagrant alias
alias vup='vagrant up'
alias vh='vagrant halt'
alias vs='vagrant suspend'
alias vr='vagrant resume'
alias vst='vagrant status'

# general alias
alias la="ls -la"
alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias ev='vim ~/.vimrc'
alias sv='source ~/.vim'
alias cddotfiles='cd ~/dotfiles'
alias eideav='vim ~/.ideavimrc'
alias zshthemes='cd ~/.oh-my-zsh/themes'
alias c='clear'
alias h='history'
alias cddocs='cd ~/Documents'
alias cddl='cd ~/Downloads'
alias cddesk='cd ~/Desktop'
alias cdapps='cd /Applications/'
alias cddownloads='cd ~/Downloads'

# sourcing aliases that should kept hidden
if [ -f ~/.aliases  ]; then
  source ~/.aliases
else
  print '404: ~/.aliases not found.'
fi
