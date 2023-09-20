#!/bin/bash
# This script is a way to fill in a few blanks, and get a task specific session.
# 4/25/2021 @ 4:25 am by Zim aka kjlw99.

# Variables:

# Set project directory:
project_dir='~/Music/music'

# Set Session name:
session_name='music'

# Set name of 1st sub-task window:
first_win='Cmus'

# Set FIRST window command:
first_win_cmd='cmus'

# Set SECOND window command:
second_win_cmd='lyvi'

# Set SECOND WINdow CoMmanD:
third_win_cmd='cava'

# Create Session within an if-conditional to check if the session exists,
# and attach if so; and if not create it.
if ! tmux has-session -t $session_name; then

  # Window_1(EXAMPLE):
  # The 1st window will have a few extra lines:
  # creation line, cd-2-project line, & rename-session line.

  # Session_start_line:
  # Start a named session, while staying detached until ready.
  tmux new -s $session_name -d

  # Rename initial window to $first_win.
  tmux rename-window -t $session_name $first_win

  # Switch(cd) to the project directory.
  tmux send-keys -t $session_name 'cd $project_dir' C-m

  # Initial command of the first window:
  tmux send-keys -t $session_name '$first_win_cmd' C-m

  # Split window once into two horrizons, run lyvi, 
  # then split the lower half into two rectangles and run cava.
  tmux split-window -t $session_name C-m

  # Run the LYrics-VIsualizer.
  tmux send-keys -t $session_name '$second_win_command' C-m

  # Split window horizontally into two rectangles on bottom half.
  tmux split window -h -t $session_name C-m

  # Run the Audio visualizer cava.
  tmux send-keys -t $session_name 'third_win_command' C-m

  # Always remember to switch back to the initial pane,
  # and attach to it!
  tmux select-pane -U -t $session_name C-m
  tmux attach -t $session_name
fi
  # Session_start_line:
  # Start a named session, while staying detached until ready.
  tmux new -s scratch_session session_name -d

# Creating a scratch tmp Session for quick one-off tasks.....
tmux new-window -t $scratch

  # Rename scratch window:
  tmux rename-window -t $session_name $scratch_win

  # Switch back to 
  tmux select-window $session_name:1
