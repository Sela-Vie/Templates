#!/bin/bash
set -e

# ===============================================
# SETUP
# ===============================================

absolute_file_path="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/$(basename -- "${BASH_SOURCE[0]}")"
absolute_folder_path_m0=$(dirname -- "$absolute_file_path")
absolute_folder_path_m1="$(cd "$absolute_folder_path_m0/.." && pwd)"

source "~/.bashrc"
source "$absolute_folder_path_m0/vars.sh"
LOG="$absolute_file_path.log"
exec 2>>"$LOG"

# ===============================================
# FUNCTIONS
# ===============================================

# || true prevent errors from stopping the program
tmux new -d -s "$SESSION_NAME" || true		
tmux_send_keys(){
	local command_string=$1
	tmux send-keys -t "$SESSION_NAME" "$command_string 2>> $LOG" C-m
}

# ===============================================
# COMMANDS
# ===============================================

echo $(date -Iseconds) 1>> $LOG
tmux_send_keys "cd $absolute_folder_path_m1"
tmux_send_keys "python3 main.py"
tmux_send_keys "python3 bane.py"
# example for error loggin