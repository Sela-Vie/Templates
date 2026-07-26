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
# SCRIPT
# ===============================================

echo $absolute_file_path
echo $absolute_folder_path_m0
echo $absolute_folder_path_m1
python3 $absolute_folder_path_m1/main.py 
python3 $absolute_folder_path_m1/maid.py	# example in error handling
echo done						            # example in code execution stoped after error