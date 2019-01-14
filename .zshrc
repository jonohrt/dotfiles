# Source Prezto.
#
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
plugins=(git osx ruby bundler brew gem rbates history-substring-search)
zstyle ':prezto:module:prompt' theme 'wikimatze'

# Add homebrew to the completion path
fpath=("/usr/local/bin/" $fpath)

export EDITOR="nvim"
# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL
export TERM='xterm-256color-italic';
bindkey -v
# 10ms for key sequences
KEYTIMEOUT=1
bindkey -M vicmd '^[' undefined-key

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

eval $(thefuck --alias)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"


# If the session is in the list of current tmux sessions, it is attached. Otherwise, a new session
# is created and attached with the argument as its name.
ta() {

  # make sure tmuxinator is installed
  if ! command -v tmuxinator 2>/dev/null; then
    echo "Tmuxinator must be installed!"
    return 1
  fi

  # ensure the name of a session was provided
  if [[ $# -eq 0 ]]; then
    echo "You must provide the name of the session to create or attach."
    return 1
  fi

  # create the session if it doesn't already exist
  # https://superuser.com/questions/1174750/tmux-has-session-search-is-prefix-matching
  tmux ls -F "#{session_name}" | grep -Fx $1 > /dev/null

  if [[ $? != 0 ]]; then

    # create the session using tmuxinator if a project exists for it
    tmuxinator start $1 2>/dev/null

    # if the tmuxinator session was started successfully, we're done!
    if [[ $? == 0 ]]; then
      return 0
    fi

    # if a tmuxinator project does not exist, create a new session
    tmux new-session -d -s $1
    tmux rename-window "working"
  fi

  # if a tmux session is already attached, switch to the new session; otherwise, attach the new
  # session
  if { [[ "$TERM" == "screen" ]] && [ -n "$TMUX" ]; } then
    tmux switch -t $1
  else
    tmux attach -t $1
  fi
}

# Kills the provided session, or the current session if no session is provided.
tk() {
  if [[ $# == 0 ]]; then
    tmux kill-session
  else
    tmux kill-session -t $1
  fi
}

tmux-sessions() {
  2>/dev/null tmux list-sessions | cut -d: -f1
}

tmuxinator-sessions() {
  tmuxinator list | tail -n +2 | gsed -e 's/\s\+/\n/g'
}

tmux-and-tmuxinator-sessions() {
  { tmux-sessions; tmuxinator-sessions; } | sort | uniq
}

tmux-sessions-autofill() {
  reply=( $( tmux-sessions ) )
}

tmux-and-tmuxinator-sessions-autofill() {
  reply=( $( tmux-and-tmuxinator-sessions ) )
}


alias -g kec='kubectl edit configmap'
alias -g kaf='kubectl apply -f'
alias -g kcuc='kubectl config use-context'
alias -g kcv='kubectl config view'

alias -g kgss='kubectl get statefulset'
alias -g kdss='kubectl describe statefulset'
alias -g kdlss='kubectl delete statefulset'
alias -g kdp='kubectl describe pod'
alias -g kdlp='kubectl delete pod'
alias -g kdls='kubectl delete service'
alias -g kdd='kubectl describe deployment'
alias -g kdld='kubectl delete deployment'
alias -g kl='kubectl logs'
alias -g kgp='kubectl get po'
alias -g kgs='kubectl get services'
alias -g kgd='kubectl get deployments'
alias -g td='tmux detach'
alias -g tl='tmux list-sessions'
alias -g dc='docker-compose'
alias -g dcra='docker-compose run app bundle exec'
alias -g dcl='docker-compose logs '
alias -g dcr='docker-compose run '

alias -g list-ports='sudo lsof -PiTCP -sTCP:LISTEN'

alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Add autocomplete to the custom tmux functions.
compctl -K tmux-and-tmuxinator-sessions-autofill ta
compctl -K tmux-sessions-autofill tk


bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$HOME/.cargo/bin:$HOME/.bin:$PATH:$HOME/Library/Python/3.6/bin"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools:/Users/jonohrt/Projects/gssl/kubernetes/client/bin
export ONFIDO_API_KEY=test_RrixH0WC5PFMaTIkisZcYsbnu8CfRW8S
# export DATABASE_URL=postgres://ufssjf6hl483bs:pfkt9u45cosat35er99mskdnl5m@ec2-52-55-241-220.compute-1.amazonaws.com:5432/d6nte8tnopamd1


export PATH=/Users/jonohrt/bin:/usr/local/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jonohrt/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jonohrt/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jonohrt/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jonohrt/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Start rbenv
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

