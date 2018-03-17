#!/usr/bin/env bash

# secrets
cprint title "secrets"

run "$VERBOSE" \
    "git clone git@gitlab.com:drieshooghe/dotfiles-secrets.git \"$SECRETS_DIR\"" \
    "Cloning secrets" \
    "true"
