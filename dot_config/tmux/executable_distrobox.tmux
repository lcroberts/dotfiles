#!/usr/bin/env bash

if [ -n "$CONTAINER_ID" ]; then
    tmux set-option -g default-shell "/bin/zsh"
fi
