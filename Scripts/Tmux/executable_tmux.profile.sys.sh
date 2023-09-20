
#!/bin/bash
# This script will allow me to get SYStem information,
# that I usually get from my top GUI system-tray.
# 4/25/2021 @ 1:02 pm by Zim aka kjlw99.

# Variables:

# Set Session name:
session_name='sys'

# Set name of 1st sub-task window:
first_win='bat'

# Set FIRST WINdow CoMmanD:
first_win_cmd=''

# Set name of second sub-task window:
second_win=''

# Set SECOND WINdow CoMmanD:
second_win_cmd=''

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

  # SECOND_WINdow(EXAMPLE)...
  # Create second window:
  tmux new-window -t $session_name

  # Rename second window:
  tmux rename-window -t $session_name $second_win

  # Initial command of the second window:
  tmux send-keys -t $session_name '$second_win_cmd' C-m

  # Always remember to switch back to the initial window,
  # and attach to it!
  tmux select-window $session_name:1
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
