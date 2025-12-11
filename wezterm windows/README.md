<h2 align="center">My WezTerm Config (Windows)</h2>

<p align="center">
  <a href="https://github.com/Amal717/Keyboard-Shortcuts/stargazers">
    <img alt="Stars" src="https://img.shields.io/github/stars/Amal717/Keyboard-Shortcuts?style=for-the-badge&color=8aadf4&logo=starship">
  </a>
  <a href="https://github.com/Amal717/Keyboard-Shortcuts/issues">
    <img alt="Issues" src="https://img.shields.io/github/issues/Amal717/Keyboard-Shortcuts?style=for-the-badge&color=f0a6ca&logo=gitbook">
  </a>
</p>

---

![screenshot](./screenshot.gif)

---

## ✨ Features (Windows Only)

- Clean & minimal WezTerm config
- Optimized Windows keyboard shortcuts
- Dynamic background image cycling
- Pane, tab, and window management shortcuts
- Font resizing key-table
- Modern UI experience powered by Lua modules

---

## 🔧 Installation (Windows)

### 1. Install WezTerm

Using **winget**:

```sh
winget install wez.wezterm
```

Or using **Scoop**:

```sh
scoop bucket add extras
scoop install wezterm
```

---

### 2. Install JetBrainsMono Nerd Font

Recommended for icons and glyph support.

```sh
scoop bucket add nerd-fonts
scoop install JetBrainsMono-NF
```

---

### 3. Clone This Repo & Install Config

```sh
git clone https://github.com/Amal717/Keyboard-Shortcuts.git
```

Then copy the Windows config folder:

```
Source:
Keyboard-Shortcuts/wezterm-windows

Destination:
C:\Users\<YourUser>\.config\wezterm
```

> Rename `wezterm-windows` → `wezterm` when placing it inside `.config`.

---

## 🎹 Windows Key Modifiers

| Modifier      | Windows Keys        |
| :------------ | :------------------ |
| **SUPER**     | `Alt`               |
| **SUPER_REV** | `Alt + Ctrl`        |
| **LEADER**    | `SUPER_REV + Space` |

---

## 🧰 Global Key Bindings

| Keys            | Action          |
| :-------------- | :-------------- |
| `F1`            | Copy mode       |
| `F2`            | Command palette |
| `F3`            | Launcher        |
| `F11`           | Fullscreen      |
| `SUPER + f`     | Search          |
| `SUPER_REV + u` | Open URL        |

### 📋 Copy / Paste

| Keys               | Action |
| :----------------- | :----- |
| `Ctrl + Shift + C` | Copy   |
| `Ctrl + Shift + V` | Paste  |

---

## ⌨ Cursor Movement

| Keys                | Action        |
| :------------------ | :------------ |
| `SUPER + Left`      | Move to start |
| `SUPER + Right`     | Move to end   |
| `SUPER + Backspace` | Clear line    |

---

## 🗂 Tabs and Windows

### Tabs

| Keys            | Action         |
| :-------------- | :------------- |
| `SUPER + t`     | New tab        |
| `SUPER_REV + w` | Close tab      |
| `SUPER + [`     | Next tab       |
| `SUPER + ]`     | Previous tab   |
| `SUPER + 9`     | Toggle tab bar |

### Windows

| Keys        | Action                             |
| :---------- | :--------------------------------- |
| `SUPER + n` | New window                         |
| `SUPER + =` | Increase font size (via key-table) |
| `SUPER + -` | Decrease font size (via key-table) |

---

## 🔳 Pane Management

### Splits

| Keys            | Action             |
| :-------------- | :----------------- |
| `SUPER + \`     | Split vertically   |
| `SUPER_REV + \` | Split horizontally |

### Navigation (Vim-style)

| Keys            | Action |
| :-------------- | :----- |
| `SUPER_REV + h` | Left   |
| `SUPER_REV + j` | Down   |
| `SUPER_REV + k` | Up     |
| `SUPER_REV + l` | Right  |

### Zoom / Close

| Keys            | Action     |
| :-------------- | :--------- |
| `SUPER + Enter` | Zoom pane  |
| `SUPER + w`     | Close pane |

---

## 🖼 Background Image Controls

| Keys            | Action             |
| :-------------- | :----------------- |
| `SUPER + /`     | Random image       |
| `SUPER + ,`     | Next image         |
| `SUPER + .`     | Previous image     |
| `SUPER_REV + /` | Fuzzy select image |
| `SUPER + b`     | Toggle blur        |

---

## 🔠 Key Table: Resize Font

**Enter with:** `LEADER + f`

| Keys        | Action           |
| :---------- | :--------------- |
| `k`         | Increase         |
| `j`         | Decrease         |
| `r`         | Reset to default |
| `q` / `Esc` | Exit             |

---

## 📐 Key Table: Resize Pane

**Enter with:** `LEADER + p`

| Keys        | Action       |
| :---------- | :----------- |
| `h`         | Shrink left  |
| `l`         | Shrink right |
| `k`         | Shrink up    |
| `j`         | Shrink down  |
| `q` / `Esc` | Exit         |

---

## 📌 Repo Structure

```
wezterm/
 ├─ wezterm.lua       # Main config
 ├─ config/           # Modules
 ├─ utils/            # Utility functions
 └─ backdrops/        # Background images
```

---

## ❤️ Credits

Made with love by **Amal** — optimized for Windows and productivity.
