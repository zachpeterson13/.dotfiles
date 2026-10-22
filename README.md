# dotfiles

VS Code (vim emulation, keyboard-first) config. Works on Windows, WSL, Linux, macOS.

## Install

| OS | Command |
|----|---------|
| macOS / Linux | `./install.sh` |
| Windows | `powershell -ExecutionPolicy Bypass -File .\install.ps1` |
| WSL | Run `install.ps1` on Windows (settings live Windows-side), then `./install.sh` inside WSL (extensions only) |

Existing files are backed up as `*.bak-<timestamp>`. Files are symlinked, so `git pull` updates VS Code immediately.
Windows symlinks need Developer Mode; otherwise files are copied and you re-run after pulling.

## Update

- Settings/keybindings: edit in repo (or via VS Code, since they're symlinks), commit, push.
- Extensions: edit `vscode/extensions.txt`, re-run installer. Installers never uninstall.
- Other VS Code builds: `CODE_BIN=codium CODE_USER_DIR=... ./install.sh` (or `-CodeBin` / `-UserDir` on Windows).

## Layout

```
vscode/settings.json
vscode/keybindings.json
vscode/extensions.txt
install.sh   install.ps1
```

Machine-specific stuff (fonts, zoom, paths) goes in the local `settings.json` only if you stop symlinking it,
or use VS Code Profiles.
