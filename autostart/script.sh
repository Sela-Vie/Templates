#!/bin/bash
set -e

# ===============================================
# SETUP
# ===============================================

script_path="${BASH_SOURCE[0]}"
script_dir=$(dirname -- "$script_path")
script_dir_m0="$(cd "$script_dir" && pwd)"
script_dir_m1="$(cd "$script_dir/.." && pwd)"

LOG="$script_path.log"
exec 2>>"$LOG"

# ===============================================
# SCRIPT
# ===============================================

echo $script_path
echo $script_dir
echo $script_dir_m0
echo $script_dir_m1
python3 $script_dir_m1/main.py 
python3 $script_dir_m1/maid.py	# example in error handling
echo done						# example in code execution stoped after error