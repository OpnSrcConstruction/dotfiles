#!/bin/bash

# Tmux profile script to open nmon in several tmux windows,
# to show off the full power of tmux, nmon, and bash-scripting.

if ! tmux has-session -t nmon; then
  # Window_1:
  # Start new Session, named nmon Detached.
  tmux new -s nmon -d
  # Rename the initial window inside the Targeted Session nmon, to nm-res(nmon-resources).
  tmux rename-window -t nmon nm-resv
  # Sends the nmon command, to the nm-res window, inside the nmon session;
  # and hits the ENTER(C-m) key inside of the window.
  tmux send-keys -t nmon 'nmon' C-m
  # Sends the r key, to the tm-res window;
  # so it can put up the resources section of nmon.
  tmux send-keys -t nmon 'r'
  # Added Virtal memory stats to the resources screen.
  tmux send-keys -t nmon 'V'
  # Window_2:
  # Add another window inside of the nmon session, named tm-cmn.
  tmux new-window -t nmon
  tmux rename-window -t nmon tm-cmn
  # Sends the nmon command, to the nm-res window, inside the nmon session;
  # and hits the ENTER(C-m) key inside of the window.
  tmux send-keys -t nmon 'nmon' C-m
  # Inside that window, press c(CPU)/m(Memory)/n(NT Input/Output).
  tmux send-keys -t nmon 'c'
  tmux send-keys -t nmon 'm'
  tmux send-keys -t nmon 'n'
  # Window_3:
  # Add another window named, tm-dio(disk_i/o).
  tmux new-window -t nmon
  tmux rename-window -t nmon tm-dio
  tmux send-keys -t nmon 'nmon' C-m
  tmux send-keys -t nmon 'd'
  # Window_4:
  # Add another Window, named tm-tp, for tmux Top-Processes.
  tmux new-window -t nmon
  tmux rename-window -t nmon tm-tp
  tmux send-keys -t nmon 'nmon' C-m
  tmux send-keys -t nmon 't'
  # Window_5:
  # Add another Window, named tm-ks, for kernal-statistics.
  tmux new-window -t nmon
  tmux rename-window -t nmon tm-ks
  tmux send-keys -t nmon 'nmon' C-m
  tmux send-keys -t nmon 'k'
  # Switch(select) the 1st window in the nmon session.
  tmux select-window -t nmon:1
  # Attach to the session, nmon.
  tmux attach -t nmon

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
