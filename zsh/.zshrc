#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Tiago Guedes <tiagopog@gmail.com>
#

plugins=(git colored-man colorize brew zsh-syntax-highlighting)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=lambda

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

unsetopt CORRECT                      # Disable autocorrect guesses. Happens when typing a wrong
                                      # command that may look like an existing one.

expand-or-complete-with-dots() {      # This bunch of code displays red dots when autocompleting
  echo -n "\e[31m......\e[0m"         # a command with the tab key, "Oh-my-zsh"-style.
  zle expand-or-complete
  zle redisplay
}

zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# Avoid displaying: ~RVM_PROJECT_PATH
# http://stackoverflow.com/questions/35237637/prezto-prompt-shows-rvm-project-path-instead-of-current-working-directory
unsetopt auto_name_dirs

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

export PATH=/Users/tiagopog/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin:/usr/local/opt/bison/bin:/usr/local/opt/llvm@6/bin:/Users/tiagopog/Dev/ruby/mruby/bin
export GOPATH=$HOME/Dev/go

if command -v pyenv 1>/dev/null 2>&1; then
  PATH=$(pyenv root)/shims:${PATH}
  eval "$(pyenv init -)"
fi

# Aliases
alias dcc="docker-compose"
alias dccs="dcc -f docker-compose.yml -f docker-compose-mac.yml"
alias gca="gcloud app"
alias gcf="gcloud alpha functions"
alias rubocop-diff="git status | awk '/modified/ {print }' | xargs rubocop"
alias docker-exec-web="docker exec -it $(docker ps | awk '/web/ {print $1}') bash"
alias vim="nvim"
# alias iex="docker run --rm -it -v $(pwd):/home -w /home elixir:latest iex"
# alias elixir="docker run --rm -it -v $(pwd):/home -w /home elixir:latest elixir"
alias ctags="/usr/local/Cellar/ctags/5.8_2/bin/ctags"

function docker-exec {
  name=${1}
  awk_str="/${name}/ {print \$1}"
  docker exec -it $(docker ps | awk ${awk_str} | head -n 1) bash
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/bin:$PATH"

# Prevents from the harmless warning message on the terminal.
# - Message: [warn] kq_init: detected broken kqueue; not using.: Undefined error: 0
# - See: https://github.com/spyder-ide/spyder/issues/3730#issuecomment-262588607
export EVENT_NOKQUEUE=1

# Crystal-related env vars
# export LDFLAGS="-L/usr/local/opt/llvm@6/lib"
# export CPPFLAGS="-I/usr/local/opt/llvm@6/include"

# Make sure gcloud works regardless the binary path of python2 defined by pyenv
export CLOUDSDK_PYTHON=/usr/local/bin/python2

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# Homebrew completion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# asdf - Tool version manager.
# * Install: https://asdf-vm.com/guide/getting-started.html#core-installation-complete
# * Elixir plugin: asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
. "/usr/local/opt/asdf/libexec/asdf.sh"
