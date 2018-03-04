#!/usr/bin/env bash

# thoughbot/dotfiles
cprint title "thoughtbot/dotfiles"


# clone / fetch
if [ ! -d "$HOME/dotfiles" ]; then
  run "$VERBOSE" \
    "git clone git://github.com/thoughtbot/dotfiles.git \"$HOME/dotfiles\"" \
    "Cloning thoughbot/dotfiles in ~/dotfiles" \
    "true"
else
  run "$VERBOSE" \
    "git --git-dir=\"$HOME/dotfiles/.git\" --work-tree=\"$HOME/dotfiles\" pull" \
    "Pulling thoughbot/dotfiles in ~/dotfiles" \
    "true"
fi

# customizations
if [ -h "$HOME/dotfiles-local" ]; then
  run "$VERBOSE" \
    "rm \"$HOME/dotfiles-local\"" \
    "Removing ~/dotfiles-local symlink" \
    "true"
elif [ -e "$HOME/dotfile-local" ]; then
  cprint error "Failed to create ~/dotfiles-local symlink as it already exists"
  exit 1
fi
run "$VERBOSE" \
  "ln -s \"$DOTFILES/local\" \"$HOME/dotfiles-local\"" \
  "Creating ~/dotfiles-local symlink" \
  "true"

# install
run "true" \
  "env RCRC=\"$HOME/dotfiles/rcrc\" rcup" \
  "Installing thoughbot/dotfiles" \
  "true"
