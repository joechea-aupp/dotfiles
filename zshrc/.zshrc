export ZSH="$HOME/.oh-my-zsh"

# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="essembeh"
# ZSH_THEME="linuxonly"
# ZSH_THEME="eastwood"
# ZSH_THEME="daveverwer"
# ZSH_THEME="agnoster"
# ZSH_THEME="spaceship"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
userPath=$(wslpath $(wslvar USERPROFILE))

plugins=(git zsh-autosuggestions zsh-syntax-highlighting vi-mode)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

export PATH="$PATH:$HOME/.local/script"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH=$PATH:/snap/bin
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

export EDITOR='nvim'

alias odoo='/opt/odoo/venv/bin/python3.12 /opt/odoo/odoo-bin -c /etc/odoo/odoo.conf -d demo'
alias code='$userPath/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe'
alias powershell.exe='/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe'
alias bat='/usr/bin/batcat'
alias python='/usr/bin/python3'
alias fsb='~/.local/script/fsb.sh'
alias fshow='~/.local/script/fshow.sh'
alias gs='git status'
alias gd='git diff'
alias sgh='gh repo list | awk '\''{print $1}'\'' | fzf | xargs -p gh repo clone'
alias sgho='gh repo list aupp-dev | awk '\''{print $1}'\'' | fzf | xargs -p gh repo clone'
alias pugh='pwd | awk -F/ '\''{print $NF}'\'' | xargs -p -I {} gh repo create --public {} --source . --push'
alias prgh='pwd | awk -F/ '\''{print $NF}'\'' | xargs -p -I {} gh repo create --private {} --source . --push'
alias explorer='/mnt/c/Windows/explorer.exe .'
alias clip='/mnt/c/Windows/System32/clip.exe'
alias pg='passgen.sh'
alias nf='neofetch'
alias lg='lazygit'
alias ld='sudo ~/.local/bin/lazydocker'
alias lz='lazysql'
alias todo='~/dev/todoist_picker/todopicker'

# Show Vi mod indicator
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd) printf "\033[1 q" ;;  # Normal mode cursor (block)
    viins|main) printf "\033[5 q" ;;  # Insert mode cursor (vertical bar)
  esac
}

function zle-line-finish {
  printf "\033[1 q"  # Default cursor shape (block) when leaving line
}

# Initialize Vi mode indicator
zle -N zle-line-init
zle -N zle-line-finish


# Bind ^D to accept word in autosuggestions
bindkey '^d' autosuggest-accept
bindkey 'jk' vi-cmd-mode
bindkey 'kj' vi-cmd-mode
bindkey -s ^f "tmux-sessionizer\n"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'batcat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
  --bind 'enter:become:command nvim {} >/dev/tty'"

# load neofetch
# neofetch

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
