#-------------------------------
#	    GENERAL
#-------------------------------

alias zshconf='vim $HOME/.zshrc'
alias vimconf='vim $HOME/.vimrc'

#-------------------------------
#           MOBILITY
#-------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cdscr='cd $SCRIPTDIR'
alias cdvgr='cd $HOME/das-machine'
alias cddev='cd $HOME/Development'
alias cdweb='cd $HOME/Development/web'
alias cdgo='cd $HOME/go'
alias cdgodh='cd $HOME/go/src/github.com/drieshooghe'
alias cdtom='cd $HOME/.tomes'


#-------------------------------
#           LIST
#-------------------------------

alias lh='ls -d .*' # List hidden files/directories
alias ls='ls -al'


#-------------------------------
#             GIT
#-------------------------------

alias gps='git push'
alias ga='git add'
alias gcm='git commit -m'
alias gs='git status'
alias gp='git pull'
alias gpo='git pull origin'
alias gd='git diff'
alias gpsom='git push origin master'
alias gra='git remote add'
alias gcl='git clone'

alias gconfdas='git config user.email "dries@dasmedia.be" && git config user.name "Dries Hooghe"'
alias gconfdries='git config user.email "dries.hooghe@gmail.com" && git config user.name "Dries Hooghe"'

# git aliases
alias gll='git ll' # git log pretty
alias glg='git lg' # git log graphic
alias glf='git lf' # git log full
alias glt='git lt' # git log my commits of today
alias glo='git lo' # git log my commits on date
alias glsd='git lsd' #git log since amount of days


#-------------------------------
#            VAGRANT
#-------------------------------
alias cdvg='cd $VGRDIR'
alias vgup='cd $VGRDIR && vagrant up'
alias vgdown='cd $VGRDIR && vagrant halt'
alias tovg='cd $VGRDIR && vagrant ssh'
