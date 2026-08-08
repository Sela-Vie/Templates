## AUTOSTART TEMPLATE

A template for launching programs inside a **tmux** session 
with optional autostart on Linux desktop login via XDG autostart

## Files

| File | Purpose |
|---|---|
| `run.sh` | Opens a named tmux session and sends the script to run your project |
| `deploy-cron.sh` | One-time installer : creates a cron entry to run your run.sh file |
| `deploy-desktop.sh` | One-time installer : copies `.desktop` file to `~/.config/autostart/` |
| `destroy-desktop.sh` | Removes the autostart `.desktop` file |
| `template.desktop` | XDG autostart entry that triggers the session script at login |
| `*.sh.log` | Stderr logs (auto-generated per script) |

## Path Variables
The scripts use these variables to resolve paths so they can be invoked anywhere:

```bash
absolute_file_path="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/$(basename -- "${BASH_SOURCE[0]}")"
absolute_folder_path_m0=$(dirname -- "$absolute_file_path")
absolute_folder_path_m1="$(cd "$absolute_folder_path_m0/.." && pwd)"
```

| Variable | What it is | Example value |
|---|---|---|
| `absolute_file_path` | Absolute path to the script | `/home/jules/git/templates/autostart/run.sh` |
| `absolute_folder_path_m0` | Absolute path to the script's directory | `/home/jules/git/templates/autostart` |
| `absolute_folder_path_m1` | Absolute path to the parent directory | `/home/jules/git/templates` |


`absolute_folder_path_m0` resolves to the directory the script lives in, so sourcing works regardless of where you invoke the script from. Change a value once in `vars.sh` and all scripts pick it up.

Each script sources it right after its SETUP block:

```bash
source "$absolute_folder_path_m0/vars.sh"
source "$absolute_folder_path_m0/functions.sh"
```
## Dependencies
- **tmux** : terminal multiplexer
- **bash** : all scripts use bash features
- **python3** : only necessary for the example executions in the program

## Notes
- Running `deploy.sh` or `run.sh` while a session is already active is safe : duplicate sessions are silently ignored.
- `set -e` is enabled in all scripts, so execution halts on the first error.
- `2>>` sets where the error logs will be sent to
