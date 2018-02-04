#-------------------------------
#           BASICS
#-------------------------------

# Disable beep on error
setopt no_beep

# Show dots while waiting for completion
COMPLETION_WAITING_DOTS="true"


#-------------------------------
#          MOBILITY
#-------------------------------

# When cmd is not recognized and part of cdpath, auto cd
setopt auto_cd


#-------------------------------
#           HISTORY
#-------------------------------
# Allow multiple terminal sessions to all append to one zsh command history
setopt append_history

# Save timestamp of command and duration
setopt extended_history

# When trimming history, lose oldest duplicates first
setopt hist_expire_dups_first

export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;


#-------------------------------
#         COMPLETION
#-------------------------------

# Do not autoselect the first completion on tab completion
unsetopt menu_complete

# Move cursor to end of word on tab completion
setopt always_to_end

# Show completion menu on successive tab press
setopt auto_menu

# Spelling correction for commands
setopt correct



#-------------------------------
#        
#-------------------------------
