````markdown
# 💻 My WezTerm Config (Windows)

<p align="center">
  <a href="https://github.com/Amal717/Keyboard-Shortcuts/stargazers">
    <img alt="Stars" src="https://img.shields.io/github/stars/Amal717/Keyboard-Shortcuts?style=for-the-badge&color=8aadf4&logo=starship">
  </a>
  <a href="https://github.com/Amal717/Keyboard-Shortcuts/issues">
    <img alt="Issues" src="https://img.shields.io/github/issues/Amal717/Keyboard-Shortcuts?style=for-the-badge&color=f0a6ca&logo=gitbook">
  </a>
</p>

---

![WezTerm Configuration Screenshot](screenshot.gif)

---

## ✨ Features (Windows Only)

- **Clean** WezTerm configuration
- **Windows-optimized** keyboard shortcuts
- Background image cycling
- Pane, tab, and window management shortcuts
- Font and pane resizing key-tables

---

## 🔧 Installation (Windows)

### 1. Install WezTerm

You can install WezTerm using **winget**:

```sh
winget install wez.wezterm
```
````

Or, using **Scoop**:

```sh
scoop bucket add extras
scoop install wezterm
```

### 2\. Install JetBrainsMono Nerd Font

It's recommended to install **JetBrainsMono Nerd Font** for the icons and glyphs to display correctly.

```sh
scoop bucket add nerd-fonts
scoop install JetBrainsMono-NF
```

### 3\. Clone Your Config

Clone the repository to your local machine:

```sh
git clone [https://github.com/Amal717/Keyboard-Shortcuts.git](https://github.com/Amal717/Keyboard-Shortcuts.git)
```

Then, copy the configuration folder to WezTerm's expected location:

```
# Source folder to copy
Keyboard-Shortcuts/wezterm-windows

# Destination folder (rename 'wezterm-windows' to 'wezterm' at the destination)
C:\Users\<YourUser>\.config\wezterm
```

---

## 🎹 Windows Key Shortcuts

These are the custom modifier key mappings used in this configuration:

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

These follow standard Windows terminal conventions.

| Keys               | Action |
| :----------------- | :----- |
| `Ctrl + Shift + C` | Copy   |
| `Ctrl + Shift + V` | Paste  |

### ⌨ Cursor Movement

| Keys                | Action             |
| :------------------ | :----------------- |
| `SUPER + Left`      | Move to line start |
| `SUPER + Right`     | Move to line end   |
| `SUPER + Backspace` | Clear line         |

---

## 🗂 Tabs and Windows

### Tab Management

| Keys            | Action                    |
| :-------------- | :------------------------ |
| `SUPER + t`     | New tab                   |
| `SUPER_REV + w` | Close tab                 |
| `SUPER + [`     | Next tab                  |
| `SUPER + ]`     | Previous tab              |
| `SUPER + 9`     | Toggle tab bar visibility |

### 🪟 Window Management

| Keys        | Action                                       |
| :---------- | :------------------------------------------- |
| `SUPER + n` | New window                                   |
| `SUPER + =` | Increase font size (in key table, see below) |
| `SUPER + -` | Decrease font size (in key table, see below) |

---

## 🔳 Pane Management

### Split Panes

| Keys            | Action                  |
| :-------------- | :---------------------- |
| `SUPER + \`     | Split pane vertically   |
| `SUPER_REV + \` | Split pane horizontally |

### Navigate Panes (Vim-style)

| Keys            | Action             |
| :-------------- | :----------------- |
| `SUPER_REV + h` | Move to pane left  |
| `SUPER_REV + j` | Move to pane down  |
| `SUPER_REV + k` | Move to pane up    |
| `SUPER_REV + l` | Move to pane right |

### Zoom / Close

| Keys            | Action                   |
| :-------------- | :----------------------- |
| `SUPER + Enter` | Zoom pane to fill window |
| `SUPER + w`     | Close current pane       |

---

## 🖼 Background Images

| Keys            | Action                 |
| :-------------- | :--------------------- |
| `SUPER + /`     | Random image           |
| `SUPER + ,`     | Next image             |
| `SUPER + .`     | Previous image         |
| `SUPER_REV + /` | Fuzzy select image     |
| `SUPER + b`     | Toggle background blur |

---

## 🔠 Key Table: Resize Font

Enter this key table with: **`LEADER + f`**

| Keys        | Action                     |
| :---------- | :------------------------- |
| `k`         | Increase font size         |
| `j`         | Decrease font size         |
| `r`         | Reset font size to default |
| `q` / `Esc` | Exit key table             |

---

## 📐 Key Table: Resize Pane

Enter this key table with: **`LEADER + p`**

| Keys        | Action            |
| :---------- | :---------------- |
| `h`         | Resize pane left  |
| `l`         | Resize pane right |
| `k`         | Resize pane up    |
| `j`         | Resize pane down  |
| `q` / `Esc` | Exit key table    |

---

## 📌 Repo Structure

```
wezterm-windows/
 ├─ wezterm.lua     <-- Main configuration file
 ├─ config/         <-- Configuration modules
 ├─ utils/          <-- Utility functions
 └─ backdrops/      <-- Folder for background images
```

```

```
