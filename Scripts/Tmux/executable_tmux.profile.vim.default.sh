#!/bin/bash
# This script is going to create a vim-layout, where the terminal is in a slim window at the bottom;
# and the file-mgr(netRW) to the Left of the main editor window.

# Created new detached session named vim.
  tmux new -s vIM -d

# Name first Window tab to vIM.
  tmux rename-window -t vIM vIM

# Initial command for the first window.
  tmux send-keys -t vIM 'vim' C-m

# Split the layout in half, by %15.
  tmux split-window -t vIM -p 15  

# Try to use send-keys to switch back to the original pane.
  tmux send-keys -t vIM '<C-a>k'

