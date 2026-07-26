#!/bin/bash
set -e

# ===============================================
# SETUP
# ===============================================

absolute_file_path="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/$(basename -- "${BASH_SOURCE[0]}")"
absolute_folder_path_m0=$(dirname -- "$absolute_file_path")
absolute_folder_path_m1="$(cd "$absolute_folder_path_m0/.." && pwd)"

LOG="$absolute_file_path.log"
exec 2>>"$LOG"

# ===============================================
# CUSTOM VARS
# ===============================================

SESSION_NAME="templates"
SCRIPT_NAME="script.sh"

# ===============================================
# FUNCTIONS
# ===============================================]

# wont stop if tmux session notif already exists
tmux new -d -s "$SESSION_NAME" || true		
tmux_send_keys(){
	local command_string=$1
	tmux send-keys -t "$SESSION_NAME" "$command_string" C-m
}

# ===============================================
# SCRIPT
# ===============================================

tmux_send_keys "cd ~"
tmux_send_keys "bash $absolute_folder_path_m0/$SCRIPT_NAME"