#!/usr/bin/env bash
# ============================================================
# Catppuccin Mocha — GNOME Terminal + Bash PS1 Installer
# Run once, works out of the box
# ============================================================

set -euo pipefail

# ── Palette ──────────────────────────────────────────────────
BASE="#1e1e2e"
SURFACE1="#45475a"
SURFACE2="#585b70"
RED="#f38ba8"
GREEN="#a6e3a1"
YELLOW="#f9e2af"
BLUE="#89b4fa"
PINK="#f5c2e7"
TEAL="#94e2d5"
MAUVE="#cba6f7"
MAROON="#eba0ac"
PEACH="#fab387"
SKY="#89dceb"
LAVENDER="#b4befe"
TEXT="#cdd6f4"
WHITE="#ffffff"

# ── 16-color palette (bold-is-bright = true makes brights pop) ──
COLORS="['$SURFACE1','$RED','$GREEN','$YELLOW','$BLUE','$MAUVE','$TEAL','$TEXT',\
'$SURFACE2','$MAROON','$GREEN','$PEACH','$LAVENDER','$PINK','$SKY','$WHITE']"

# ── Find default GNOME Terminal profile ──────────────────────
PROFILE_LIST_PATH="/org/gnome/terminal/legacy/profiles:"
DCONF_PROFILES=$(dconf read "$PROFILE_LIST_PATH/list" 2>/dev/null || echo "")

if [[ -z "$DCONF_PROFILES" || "$DCONF_PROFILES" == "@as []" ]]; then
  echo "❌  No GNOME Terminal profiles found."
  echo "    Open GNOME Terminal at least once, then re-run this script."
  exit 1
fi

PROFILE_ID=$(echo "$DCONF_PROFILES" | tr -d "[]'" | tr ',' '\n' | head -1 | xargs)
PROFILE_PATH="$PROFILE_LIST_PATH/:$PROFILE_ID"

echo "🎨  Applying Catppuccin Mocha to GNOME Terminal..."

# ── Apply terminal colors ────────────────────────────────────
dconf write "$PROFILE_PATH/visible-name"                    "'Catppuccin Mocha'"
dconf write "$PROFILE_PATH/use-theme-colors"                "false"
dconf write "$PROFILE_PATH/use-theme-background"            "false"
dconf write "$PROFILE_PATH/use-theme-transparency"          "false"
dconf write "$PROFILE_PATH/use-transparent-background"      "false"
dconf write "$PROFILE_PATH/background-transparency-percent" "0"
dconf write "$PROFILE_PATH/background-color"                "'$BASE'"
dconf write "$PROFILE_PATH/foreground-color"                "'$TEXT'"
dconf write "$PROFILE_PATH/bold-color"                      "'$WHITE'"
dconf write "$PROFILE_PATH/bold-color-same-as-fg"           "false"
dconf write "$PROFILE_PATH/bold-is-bright"                  "true"
dconf write "$PROFILE_PATH/cursor-colors-set"               "true"
dconf write "$PROFILE_PATH/cursor-background-color"         "'$MAUVE'"
dconf write "$PROFILE_PATH/cursor-foreground-color"         "'$BASE'"
dconf write "$PROFILE_PATH/cursor-shape"                    "'block'"
dconf write "$PROFILE_PATH/palette"                         "$COLORS"
dconf write "$PROFILE_PATH/scrollbar-policy"                "'always'"
dconf write "$PROFILE_PATH/audible-bell"                    "true"

echo "✅  GNOME Terminal colors applied."

# ── Patch ~/.bashrc with Catppuccin PS1 ──────────────────────
BASHRC="$HOME/.bashrc"
MARKER="# ── CATPPUCCIN MOCHA PS1"

if grep -q "$MARKER" "$BASHRC" 2>/dev/null; then
  echo "ℹ️   PS1 already set in ~/.bashrc — skipping."
else
  echo "" >> "$BASHRC"
  cat >> "$BASHRC" << 'EOF'
# ── CATPPUCCIN MOCHA PS1 ─────────────────────────────────────
_MAUVE="\[\e[38;2;203;166;247m\]"
_GREEN="\[\e[38;2;166;227;161m\]"
_BLUE="\[\e[38;2;137;180;250m\]"
_PEACH="\[\e[38;2;250;179;135m\]"
_RESET="\[\e[0m\]"
_status() { [[ $? != 0 ]] && echo -n " ✗"; }
PS1="${_MAUVE}┌─[${_GREEN}\u${_MAUVE}@${_BLUE}\h${_MAUVE}]─[${_PEACH}\w${_MAUVE}]\$(_status)\n${_MAUVE}└─${_GREEN}\$${_RESET} "
EOF
  echo "✅  Catppuccin PS1 added to ~/.bashrc."
fi

echo ""
echo "┌─────────────────────────────────────────┐"
echo "│  All done! Do:                          │"
echo "│    source ~/.bashrc                     │"
echo "│  Then open a new terminal window.       │"
echo "└─────────────────────────────────────────┘"
