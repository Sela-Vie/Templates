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
# SCRIPT
# ===============================================

rm ~/.config/autostart/$SESSION_NAME.desktop