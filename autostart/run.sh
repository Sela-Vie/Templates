#!/bin/bash
set -e

# ===============================================
# SETUP
# ===============================================

SESSION_NAME="templates"
SCRIPT_NAME="script.sh"

# ===============================================

script_path="${BASH_SOURCE[0]}"
script_dir=$(dirname -- "$script_path")
script_dir_m0="$(cd "$script_dir" && pwd)"
script_dir_m1="$(cd "$script_dir/.." && pwd)"

# ===============================================
# FUNCTIONS
# ===============================================
LOG="$script_path.log"
exec 2>>"$LOG"

# wont stop if tmux session notif already exists
tmux new -d -s "$SESSION_NAME" || true		
tmux_send_keys(){
	local command_string=$1
	tmux send-keys -t "$SESSION_NAME" "$command_string" C-m
}

# ===============================================
# COMMANDS
# ===============================================

tmux_send_keys "cd ~"
tmux_send_keys "bash $script_dir_m0/$SCRIPT_NAME"