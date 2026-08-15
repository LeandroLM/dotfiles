#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

symlink() {
  local src="$DOTFILES/$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  echo "  linked  $dst"
}

copy() {
  local src="$DOTFILES/$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"
  echo "  copied  $dst"
}

echo "Installing dotfiles from $DOTFILES..."

# ── tmux ──────────────────────────────────────────────────────────────────────
# ~/.tmux.conf is fully personal — omarchy never touches it.
symlink tmux.conf ~/.tmux.conf

# ~/.config/tmux/tmux.conf is the omarchy entry point.
# It just sets the plugin path and delegates to ~/.tmux.conf.
# Copied (not linked) because omarchy may replace it on major upgrades;
# run install.sh again if that happens.
copy tmux-omarchy.conf ~/.config/tmux/tmux.conf

# ── Hyprland (Lua config) ─────────────────────────────────────────────────────
# Hyprland runs hyprland.lua (Lua provider), so these are the active user files.
# Symlinked — they survive omarchy updates and are unlikely to be reset except
# on major version migrations (run install.sh again if that happens).
symlink hypr/input.lua ~/.config/hypr/input.lua
symlink hypr/autostart.lua ~/.config/hypr/autostart.lua

# ── Terminal fonts ─────────────────────────────────────────────────────────────
# Omarchy resets these on major upgrades; copied so install.sh restores them.
copy terminal/foot.ini ~/.config/foot/foot.ini
copy terminal/ghostty  ~/.config/ghostty/config
copy terminal/kitty.conf ~/.config/kitty/kitty.conf

echo "Done. Reload Hyprland (hyprctl reload) and restart your terminal for changes to take effect."
