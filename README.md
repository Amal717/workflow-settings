# Dev Environment — Neovim + Tmux

Minimal setup for Rust / C / C++ development.
Terminal only. No GUI. Catppuccin mocha theme across both.

---

## Install

### Neovim

```bash
mkdir -p ~/.config/nvim
cp init.lua ~/.config/nvim/init.lua
nvim
```

First launch downloads catppuccin automatically. Wait a few seconds, then restart nvim.

### Tmux

```bash
cp .tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf   # if tmux is already open
```

---

## Neovim

### What's inside

- **Catppuccin mocha** — theme, transparent background so it blends into your terminal
- **Treesitter** — better syntax highlighting for C, C++, Rust, Lua, Bash, Toml, Make
- **Statusline** — built-in, no plugin. Shows mode, file, filetype, line:col, percentage
- **Netrw** — built-in file browser, tree view, no banner

### Things that happen automatically

- Trailing whitespace stripped on every save
- Cursor returns to last position when you reopen a file
- Yanked text flashes briefly so you can see what was copied
- Help and quickfix windows close with `q`
- Splits resize evenly when terminal is resized

### Keymaps

#### Navigation
| Key | Action |
|-----|--------|
| `Ctrl + d` | Scroll down (cursor stays centered) |
| `Ctrl + u` | Scroll up (cursor stays centered) |
| `n / N` | Next/previous search result (centered) |
| `Shift + l` | Next open buffer |
| `Shift + h` | Previous open buffer |

#### Editing
| Key | Action |
|-----|--------|
| `Ctrl + s` | Save file |
| `J` (visual) | Move selected lines down |
| `K` (visual) | Move selected lines up |
| `>` (visual) | Indent right, stay selected |
| `<` (visual) | Indent left, stay selected |
| `Space + p` (visual) | Paste without losing clipboard |
| `Space + r` | Replace word under cursor across whole file |

#### Files & Buffers
| Key | Action |
|-----|--------|
| `Space + e` | Open file browser (netrw) |
| `Space + bd` | Close current buffer |

#### Other
| Key | Action |
|-----|--------|
| `Escape` | Clear search highlights |

### Changing the theme flavour

Open `~/.config/nvim/init.lua` and find this line:

```lua
flavour = "mocha"
```

Change to any of: `latte` (light), `frappe`, `macchiato`, `mocha`

### Removing old plugins

If you had plugins before and want a clean slate:

```bash
rm -rf ~/.local/share/nvim/lazy/
rm -rf ~/.local/state/nvim/lazy/
```

---

## Tmux

### Logic

- **Alt** — things you do constantly, no prefix needed
- **Ctrl+Space** — things you do occasionally, prefix required

### Keymaps

#### Splits & Panes (Alt, no prefix)
| Key | Action |
|-----|--------|
| `Alt + \` | Vertical split (side by side) |
| `Alt + -` | Horizontal split (top/bottom) |
| `Alt + h` | Move to left pane |
| `Alt + j` | Move to pane below |
| `Alt + k` | Move to pane above |
| `Alt + l` | Move to right pane |

#### Windows (Alt, no prefix)
| Key | Action |
|-----|--------|
| `Alt + n` | Next window |
| `Alt + p` | Previous window |

#### Occasional actions (Ctrl+Space prefix)
| Key | Action |
|-----|--------|
| `prefix + c` | New window (opens in same directory) |
| `prefix + x` | Kill current pane |
| `prefix + q` | Kill current window |
| `prefix + r` | Reload tmux config |
| `prefix + Enter` | Enter scroll/copy mode |
| `prefix + arrows` | Resize pane |

#### Copy mode (enter with prefix + Enter)
| Key | Action |
|-----|--------|
| `v` | Start selection |
| `y` | Copy selection |
| `Escape` | Exit copy mode |

#### Unchanged terminal keys
| Key | Action |
|-----|--------|
| `Ctrl + l` | Clear terminal (works normally) |

### Changing the theme flavour

Open `~/.tmux.conf` and find the colors section. Change the hex values to match whichever catppuccin flavour you use in nvim. Official colors at https://catppuccin.com

---

## No conflicts between Nvim and Tmux

- `Alt` keys are only used by tmux, nvim doesn't use Alt
- `Ctrl+Space` prefix doesn't interfere with anything in nvim
- `Space` as nvim leader is fine — tmux prefix is `Ctrl+Space`, not bare `Space`
- `Ctrl+l` is untouched, clears terminal normally
