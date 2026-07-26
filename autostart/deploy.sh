#!/bin/bash
set -e

script_path="${BASH_SOURCE[0]}"
script_dir=$(dirname -- "$script_path")

cp $script_dir/templates.desktop ~/.config/autostart