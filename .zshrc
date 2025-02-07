# load zgen
source "${HOME}/.zgen/zgen.zsh"

# Paths
export PATH=$PATH:"$HOME/scripts"

# Aliases
alias python="python3"
alias editz="vim ~/.zshrc"
alias reloadz="source ~/.zshrc"
alias activate="source env/bin/activate"
alias venv="python -m venv env"
alias build_image='docker build -t dev_image ~/code/dev_container'
alias build_container='docker run -it -v "$HOME/code:/home/dev21/code" \
                                -v "$HOME/scripts:/home/dev21/scripts" \
                                --name dev_container dev_image zsh'
alias start_container='docker start -i dev_container'
#alias container_stop='docker stop dev_container'
alias remove_container="docker container rm dev_container"
alias remove_image="docker image rm dev_image"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search
   
    # completions
    zgen load zsh-users/zsh-completions src
    
    # theme
    zgen load spaceship-prompt/spaceship-prompt spaceship

    # save all to init script
    zgen save
fi

autoload -U colors; colors
RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

SPACESHIP_PROMPT_ORDER=(
  venv          # virtualenv section
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  gcloud        # Gcloud section
  aws           # Amazon Web Services section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubectl       # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
 )
