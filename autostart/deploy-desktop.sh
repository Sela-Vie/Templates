#!/bin/bash
set -e

# ===============================================
# SETUP
# ===============================================


absolute_file_path="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/$(basename -- "${BASH_SOURCE[0]}")"
absolute_folder_path_m0=$(dirname -- "$absolute_file_path")

source "$absolute_folder_path_m0/vars.sh"
exec 2>>"$absolute_file_path.log"

# ===============================================
# CUSTOM VARS
# ===============================================

script_dir="$absolute_folder_path_m0/run.sh"
file_template="$absolute_folder_path_m0/template.desktop"
file_output="$HOME/.config/autostart/$SESSION_NAME.desktop"

# ===============================================
# SCRIPT
# ===============================================

mkdir -p "$HOME/.config/autostart"
sed -e "s|^Exec=.*|Exec=sh -c '$script_dir'|" -e "s|^TryExec=.*|TryExec=$script_dir|" "$file_template" > "$file_output"