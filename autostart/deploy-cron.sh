#!/bin/bash
set -e

# ===============================================
# SETUP
# ===============================================

absolute_file_path="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/$(basename -- "${BASH_SOURCE[0]}")"
absolute_folder_path_m0=$(dirname -- "$absolute_file_path")

exec 2>>"$absolute_file_path.log"

# ===============================================
# SCRIPT
# ===============================================

(crontab -l ; echo "*/5 * * * * bash $absolute_folder_path_m0/run.sh") | crontab -