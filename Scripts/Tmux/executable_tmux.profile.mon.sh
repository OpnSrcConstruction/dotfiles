#!/bin/bash

# Tmux profile script to show off my favorite monitoring tools.
# Attempting a trick to wrap this script in a if-then-else statement,
# that checks if a session is running & if yes will attach;
# and if no will create the session.

if ! tmux has-session -t mon; then
  # Window_1:
  # Start new Session, named mon Detached.
  tmux new -s mon -d
  # Rename the initial window inside the Targeted Session mon, to tm-nf(NeoFetch).
  tmux rename-window -t mon tm-nf
  # Sends the mon command, to the nm-res window, inside the mon session;
  # and hits the ENTER(C-m) key inside of the window.
  # ENTER the text neofetch & execute it.
  tmux send-keys -t mon 'neofetch' C-m

  # Window_2:
  # Add another window named, tm-df(graphical df replacement duf).
  # NOTE: this script is dependant on a duf w/ options -> df alias in my shell configs.
  tmux new-window -t mon
  tmux rename-window -t mon tm-df
  tmux send-keys -t mon 'df' C-m

  # Window_3
  # Add another window inside of the mon session, named ym-ht(htop).
  # NOTE: htop was granted special sudo NOPASS no password needed privaleges.
  tmux new-window -t mon
  tmux rename-window -t mon tm-ht
  tmux send-keys -t mon 'sudo htop' C-m

  # Window_4:
  # Add another Window, named tm-nm, for nmon(+c{cpu}/m{memory}/n{NT-transfer}.
  tmux new-window -t mon
  tmux rename-window -t mon tm-ks
  tmux send-keys -t mon 'nmon' C-m
  tmux send-keys -t mon 'c'
  tmux send-keys -t mon 'm'
  tmux send-keys -t mon 'n'

  # Window_5:
  # Add another Window, named tm-nh, for tmux-nethogs(application bandwidth hog monitoring).
  # NOTE: nethogs was granted special sudo NOPASS no password needed privaleges.
  tmux new-window -t mon
  tmux rename-window -t mon tm-nh
  tmux send-keys -t mon 'sudo nethogs' C-m
  tmux send-keys -t mon 't'

  # Window_6:
  # A window to monitor Disk I/O with the iotop command.
  # NOTE: iotop was granted special sudo NOPASS no password needed privaleges.
  tmux new-window -t mon
  tmux rename-window -t mon tm-iot
  tmux send-keys -t mon 'sudo iotop' C-m

  # Move to window one, of Session mon.
  tmux select-window -t mon:1

  # Attach to the session, mon.
  tmux attach -t mon

fi
tmux attach -t mon
