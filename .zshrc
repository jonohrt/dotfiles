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
# 10ms for key sequences
export KEYTIMEOUT=1

MODE_CURSOR_VICMD="green block"
MODE_CURSOR_VIINS="#20d08a blinking bar"
MODE_CURSOR_SEARCH="#ff00ff steady underline"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,node_modules}/*"'
export FZF_DEFAULT_COMMAND='fd . --follow --hidden --exclude ".git" --exclude "node_modules" --color=always'
# export FZF_DEFAULT_OPTS="--ansi" #-jheight=70% --preview='bat {}' --preview-window=right:60%:wrap"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

# fr() {
#   fd . --type d
# }
# # fzf --bind 'f1:execute(fd . ~/{})
# zle -N fr{,}
# bindkey '^f' "fr"
# bindkey -s '^f' '$(fd . --type d | fzf)^M'

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


alias -g kbx='kubectx'
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
alias gpo='git pull origin'
alias gc="git checkout"

alias gcb='git checkout -b'
alias gco='git checkout $(git branch | fzy)'

alias lioj='ssh-add -D && ssh-add ~/.ssh/github_optijon_rsa'
alias lij='ssh-add -D && ssh-add ~/.ssh/jonohrt_github_rsa'
alias hprs='hub pr show'

# Add autocomplete to the custom tmux functions.
compctl -K tmux-and-tmuxinator-sessions-autofill ta
compctl -K tmux-sessions-autofill tk

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$HOME/.cargo/bin:$HOME/.bin:$PATH:$HOME/Library/Python/3.6/bin"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools:/Users/jonohrt/Projects/gssl/kubernetes/client/bin
export ONFIDO_API_KEY=test_RrixH0WC5PFMaTIkisZcYsbnu8CfRW8S
# export DATABASE_URL=postgres://ufssjf6hl483bs:pfkt9u45cosat35er99mskdnl5m@ec2-52-55-241-220.compute-1.amazonaws.com:5432/d6nte8tnopamd1

export PATH=/Users/jonohrt/bin:/usr/local/bin:$PATH:/Users/johrt/Projects/tesla/projects/tesla-auth/bin


# Start rbenv
eval "$(rbenv init -)"

#Start direnv
eval "$(direnv hook zsh)"



export PATH=~/bin:$PATH

alias cat="ccat"
# Tesla project shortcuts
alias @tesla='cd $HOME/Projects/tesla'
alias @adapter='cd $HOME/Projects/tesla/projects/tesla-adapter'
alias @auth='cd $HOME/Projects/tesla/projects/tesla-auth'
alias @data-point='cd $HOME/Projects/tesla/projects/tesla-data-point'
alias @deployment='cd $HOME/Projects/tesla/projects/tesla-deployment'
alias @permission='cd $HOME/Projects/tesla/projects/tesla-permission'
alias @proxy='cd $HOME/Projects/tesla/projects/tesla-proxy'
alias @site='cd $HOME/Projects/tesla/projects/tesla-site'
alias @ui='cd $HOME/Projects/tesla/projects/tesla-ui'
alias @weather='cd $HOME/Projects/tesla/projects/tesla-weather'

alias dfl='dotfiles '
alias kx="kubectx"
alias gco="git branch | cut -c 3- | fzy | xargs git checkout"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/johrt/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/johrt/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/johrt/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/johrt/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down

my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Change cursor shape between insert and normal mode in iTerm2.app

# {{{1 vi mode cursor indicator
function zle-keymap-select zle-line-init
{
    # change cursor shape
    if [[ -n "$TMUX" ]]; then  # tmux
      case $KEYMAP in
          vicmd)      print -n '\033[0 q';; # block cursor
          viins|main) echo -ne '\e[5 q'
      esac
    else # iTerm2
      case $KEYMAP in
          vicmd)      print -n '\033[0 q';; # block cursor
          viins|main) echo -ne '\e[5 q'
          # vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
          # viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
      esac
    fi

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    if [[ -n "$TMUX" ]]; then # tmux
      print -n -- '\033[0 q'  # block cursor
    else # iTerm2
      print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
    fi
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select


_fzf_complete_git() {
    ARGS="$@"
    local branches
    branches=$(git branch -vv --all)
    if [[ $ARGS == 'git co'* ]]; then
        _fzf_complete "--reverse --multi" "$@" < <(
            echo $branches
        )
    else
        eval "zle ${fzf_default_completion:-expand-or-complete}"
    fi
}

_fzf_complete_git_post() {
    awk '{print $1}'
}

# export RUBYOPT='-W:no-deprecated -W:no-experimental'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# GIT heart FZF
# -------------

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

fzf_gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

fzf_gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

fzf_gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

fzf_gg() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

fzf_gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}

# A helper function to join multi-line output from fzf
join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(fzf_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}

bindkey -r "^G"
bind-git-helper f b t g r
unset -f bind-git-helper
