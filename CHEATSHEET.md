# Cheatsheet

Leader = `Space`. Normal mode unless noted. Source: `vscode/settings.json`, `vscode/keybindings.json`.

## Editing tweaks

| Key | Does |
|-----|------|
| `J` | Join lines, cursor stays |
| `Ctrl+d` / `Ctrl+u` | Half-page down/up, centered |
| `n` / `N` | Next/prev match, centered |
| `Q` | Disabled |
| `Ctrl+c` (insert) | Esc |
| `<leader>y` / `<leader>Y` | Yank to system clipboard (motion / line) |
| `<leader>d` | Delete to black hole (no register clobber) |
| `<leader>n` | Clear search highlight |
| `<leader>s` | Find & replace |
| `<leader>f` | Format document |
| `<leader>x` | Close editor |

Visual mode:

| Key | Does |
|-----|------|
| `J` / `K` | Move selected lines down/up |
| `<` / `>` | Outdent/indent (stays in visual) |
| `<leader>p` | Paste over selection, keep register |
| `<leader>y` / `<leader>d` | Clipboard yank / black-hole delete |

## Find / files

| Key | Does |
|-----|------|
| `Ctrl+p` / `<leader>pf` | Quick open file |
| `<leader>ps` | Search in files |
| `<leader>pw` | Workspace symbols |
| `<leader>pr` | Recent projects |
| `<leader>pc` | Command palette |
| `<leader>pv` | Focus file explorer |

## Harpoon-lite (pinned tabs)

| Key | Does |
|-----|------|
| `<leader>a` / `<leader>A` | Pin / unpin current tab |
| `Ctrl+h` / `t` / `n` / `s` | Jump to tab 1 / 2 / 3 / 4 (pinned tabs sort first) |
| `Ctrl+e` | List open editors |

## LSP / diagnostics

| Key | Does |
|-----|------|
| `gd` / `gr` / `gi` | Definition / references / implementation |
| `K` | Hover |
| `[d` / `]d` | Prev/next diagnostic (file) |
| `Ctrl+j` / `Ctrl+k` | Next/prev diagnostic (all files) |
| `<leader>vd` | Hover diagnostic |
| `<leader>vca` | Quick fix / code action |
| `<leader>vrr` | References |
| `<leader>vrn` | Rename symbol |

## Insert-mode completion

| Key | Does |
|-----|------|
| `Ctrl+n` / `Ctrl+p` | Next/prev suggestion |
| `Ctrl+y` | Accept suggestion (Tab no longer accepts) |
| `Ctrl+Space` | Trigger suggest |
| `Ctrl+h` | Parameter hints |

## Git

| Key | Does |
|-----|------|
| `<leader>gs` | Source control view |
| `<leader>gb` | Toggle blame |
| `<leader>gd` | Open diff for file |
| `<leader>u` | Timeline (undo-tree-ish) |

## Windows / panels

| Key | Does |
|-----|------|
| `<leader>wv` / `ws` | Split right / down |
| `<leader>wh/j/k/l` | Focus left/down/up/right |
| `<leader>wo` | Join all groups (only) |
| `<leader>wm` | Maximize panel |
| `<leader>t` | Toggle terminal |
| `<leader>b` | Toggle sidebar |
| `<leader>z` | Zen mode |

## File explorer (when focused)

| Key | Does |
|-----|------|
| `j` / `k` | Down / up |
| `l` / `h` | Open / collapse |
| `a` / `r` / `d` | New file / rename / delete |
| `Esc` | Back to editor |

## Default Vim worth remembering

| Key | Does |
|-----|------|
| `gt` / `gT` | Next / prev editor tab (`:bn` / `:bp`) |
| `Ctrl+w h/j/k/l` | Focus split (same as `<leader>wh/j/k/l`) |
| `Ctrl+o` / `Ctrl+i` | Jump back / forward in jump list |
| `*` / `#` | Search word under cursor forward / back |
| `%` | Jump to matching bracket |
| `ci"` / `di(` / `vip` | Change / delete / select inside quotes, parens, paragraph |
| `.` | Repeat last change |
| `zz` / `zt` / `zb` | Center / top / bottom cursor line |
| `Ctrl+v` | Block select |
| `gv` | Reselect last visual selection |
| `ma` / `` `a `` | Set / jump to mark a |
| `:%s/a/b/g` | Substitute in file |

## Plugins (vim extension)

| Key | Does |
|-----|------|
| `s{c}{c}` / `S{c}{c}` | Sneak forward / backward |
| `ys{motion}{c}` | Surround add (`ysiw"`) |
| `cs{old}{new}` / `ds{c}` | Surround change / delete |
| `<leader><leader>` + motion | EasyMotion (`<leader><leader>w`, `<leader><leader>s{c}`) |
| CamelCaseMotion | Enabled (default maps are `<leader>w/b/e`, which clash with `<leader>w…` windows) |
