# Autostart Template

A template for launching programs inside a **tmux** session 
with optional autostart on Linux desktop login via XDG autostart

## How It Works

```
1. Desktop login 		(activates all .desktop files in the autostart folder)
2. templates.desktop	(calls run.sh)
3. run.sh		(creates tmux session and calls the script file)
4. script.sh		(your commands in tmux)
5. your commands		(e.g. python3 main.py)
```

## Files

| File | Purpose |
|---|---|
| `deploy.sh` | One-time installer : copies `.desktop` file to `~/.config/autostart/` |
| `destroy.sh` | Removes the autostart `.desktop` file |
| `templates.desktop` | XDG autostart entry that triggers the session script at login |
| `run.sh` | Opens a named tmux session and sends the work script into it |
| `script.sh` | Runs inside tmux; contains the actual commands to execute |
| `*.sh.log` | Stderr logs (auto-generated, one per script) |

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

## Customization

Edit the variables at the top of each script:

- **`run.sh`**
  - `SESSION_NAME` : tmux session name (default: `"templates"`)
  - `SCRIPT_NAME` : work script to run inside tmux (default: `"script.sh"`)

- **`script.sh`** : replace the commands with your own (lines ~19-24).

- **`templates.desktop`** : update the `Exec` path if the project lives somewhere other than `~/git/templates/autostart/`.

## Dependencies

- **tmux** : terminal multiplexer
- **bash** : all scripts use bash features
- **python3** : used by the example commands in `templates-script.sh`
- A **freedesktop-compliant desktop environment** (GNOME, KDE, XFCE, etc.) for XDG autostart support

## Logs

Each script writes stderr to its corresponding `.log` file based on the name of the script file
- `run.sh.log`
- `script.sh.log`

## Notes

- Running `deploy.sh` or `run.sh` while a session is already active is safe : duplicate sessions are silently ignored.
- `set -e` is enabled in all scripts, so execution halts on the first error.
