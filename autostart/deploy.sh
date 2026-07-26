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

SCRIPT_NAME="run.sh"
script_dir="$absolute_folder_path_m0/$SCRIPT_NAME"

file_template="$absolute_folder_path_m0/templates.desktop"
file_output="$HOME/.config/autostart/templates.desktop"

# ===============================================
# SCRIPT
# ===============================================

mkdir -p "$HOME/.config/autostart"
sed "s|Exec=.*|Exec=sh -c '$script_dir'|" $file_template > $file_output