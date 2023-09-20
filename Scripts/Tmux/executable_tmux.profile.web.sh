#!/bin/bash
# This script will launch several Window/tabs inside a session named web.
# The sessions will be:
# ~ w3m -v For w3m informational searches with fzf/surfraw.
# ~ News-boat NewsFeed-Reader && Open Bottom split Open to where I save PDF articles/Blog-posts.
# ~ Buku Portable synced cli web bookmarks.
# ~ Upass Ncurses Text-User-Inerface menu driven pass GPG Password-store access.
# ~ Neomutt Cli managed E-mail client managed by the mutt-wizzard script.
# I will use the lw alias for this Tmux lanch-web script.
# 9/11/2021 @ 11:22:07 by Zim aka kjlw99.

# Variables:

# Set project directory:
project_dir='/'

# Set Session name:
session_name='Web'

# Set name of 1st sub-task window:
first_win='w3m'

# Set FIRST WINdow CoMmanD:
first_win_cmd='w3m -v'

# Set name of second sub-task window:
second_win='News-boat'

# Set SECOND WINdow CoMmanD:
second_win_cmd='newsboat'

# Newsboat will require a window split, switch-to, and
# Changing to where I save my PDFs.

# Set name of third sub-task window:
third_win='buku'

# Set THIRD Window Command:
third_win_cmd='buku'

# Set name of FOURTH sub-task window:
fourth_win='Upass'

# Set FOURTH Window command:
fourth_win_cmd='upass'

# Set name of FIFTH sub-task window:
fifth_win=''

# Set FIFTH Window command:
fifth_win_cmd=''

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

  # Split Window into two vertical horrizons.
  tmux split-window C-m

  # Change to My PDF save location.
  tmux send-keys -t $session_name 'cd ~/Documents/other/PDF/articles' C-m

  # Go back to top payne, b/c I want to start on top with newsboat open.
  tmux select-pane -t $session_name -U && clear C-m



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
