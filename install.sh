#!/usr/bin/env bash
# Link VS Code config from this repo. macOS / Linux / WSL.
# Windows: use install.ps1.
# Overrides: CODE_BIN=codium CODE_USER_DIR=/path/to/User ./install.sh
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CODE_BIN="${CODE_BIN:-code}"
STAMP="$(date +%Y%m%d-%H%M%S)"

is_wsl() { grep -qi microsoft /proc/version 2>/dev/null; }

case "$(uname -s)" in
  Darwin) DEFAULT_DIR="$HOME/Library/Application Support/Code/User" ;;
  Linux)  DEFAULT_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/Code/User" ;;
  *) echo "Unsupported shell/OS ($(uname -s)). On Windows run install.ps1." >&2; exit 1 ;;
esac
USER_DIR="${CODE_USER_DIR:-$DEFAULT_DIR}"

link() { # link <src> <dst>
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "ok     $dst"; return
  fi
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mv "$dst" "$dst.bak-$STAMP"; echo "backup $dst.bak-$STAMP"
  fi
  ln -s "$src" "$dst"; echo "link   $dst -> $src"
}

install_exts() {
  if ! command -v "$CODE_BIN" >/dev/null 2>&1; then
    echo "skip extensions: '$CODE_BIN' not on PATH (VS Code: Cmd/Ctrl+Shift+P > Shell Command: Install 'code' command)" >&2
    return
  fi
  grep -vE '^[[:space:]]*(#|$)' "$REPO/vscode/extensions.txt" | while read -r ext; do
    if "$CODE_BIN" --install-extension "$ext" </dev/null >/dev/null 2>&1; then
      echo "ext    $ext"
    else
      echo "FAILED $ext" >&2
    fi
  done
}

if is_wsl && [ -z "${CODE_USER_DIR:-}" ]; then
  # In WSL, VS Code reads user settings from the Windows side.
  # Run install.ps1 from Windows for settings; this installs extensions into WSL.
  echo "WSL detected: skipping settings link (run install.ps1 on Windows). Installing extensions into WSL only."
else
  link "$REPO/vscode/settings.json"    "$USER_DIR/settings.json"
  link "$REPO/vscode/keybindings.json" "$USER_DIR/keybindings.json"
fi
install_exts
echo "done"
