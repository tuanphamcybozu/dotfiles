# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
export LANG="en_US@UTF-8"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias zs='vim ~/.zshrc'
alias load='source ~/.zshrc'
alias ll='ls -al'
alias ls='ls -GF'

#Color setting
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'


eval "$(starship init zsh)"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Git branch in prompt.

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# export PS1="\[\e[1;31m\]\u@ \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias pi='pnpm install'
alias pb='pnpm build'
alias pib='pnpm install && pnpm build'
alias pt='pnpm test'
alias pe2e='pnpm test:e2e'


alias phpstorm='open -a "PhpStorm 2023.3.app" .'
alias gs='git status'
alias gf='git fetch'
alias gpu='git pull'
alias gfp='git fetch && git pull'
alias gc='git commit -m'
alias gca='git commit --amend --no-edit'
alias gl='git log'
alias glo='git log --oneline'
alias go='git checkout'
alias gp='git push origin'
alias gph='git push origin HEAD'
alias gpuh='git push -u origin HEAD'
alias ga='git add'
alias gb='git branch'
alias grh='git reset --hard'
alias grs='git reset --soft'
alias gd='git diff'
alias gcp='git cherry-pick'
alias gpf='git push -f'

alias dp='docker ps'
alias dpa='docker ps -a'
alias ds='docker start'
alias dsp='docker stop'
alias dx='docker exec -it'
alias di='docker images'
alias drm='docker rm'
alias dr='docker run -it'
alias drmi='docker rmi'

alias l='ls -la'
alias e='exa -alh'
alias et='exa -alh --tree --level'
alias c1='cd .. && l'
alias c2='cd ../.. && l'
alias c3='cd ../../.. && l'

c ()
{
   cd "$1" && l
}

mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

alias p='pwd'
alias h='history 300'

alias ip='ifconfig'
alias python='/usr/bin/python3'

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

alias cl=clear

HISTSIZE=500

eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
