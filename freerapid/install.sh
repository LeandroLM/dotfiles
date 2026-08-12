#!/bin/bash
# Install FreeRapid Downloader (patched for JDK 26 + Wayland/Hyprland).
# No download needed — everything is bundled in this repo.
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALL_DIR="$HOME/.local/share/FreeRapid"
PLUGINS_DIR="$HOME/.FRD/plugins"
BIN_DIR="$HOME/.local/bin"
APPS_DIR="$HOME/.local/share/applications"

# ── 1. Copy app files ────────────────────────────────────────────────────────
echo "Installing FreeRapid to $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR"
rsync -a "$REPO_DIR/app/" "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR/frd.sh"

# ── 2. Install plugins ───────────────────────────────────────────────────────
echo "Installing plugins..."
mkdir -p "$PLUGINS_DIR"
cp "$INSTALL_DIR/plugins/"*.frp "$PLUGINS_DIR/"

# ── 3. Wayland clipboard bridge ──────────────────────────────────────────────
echo "Installing wayland-xclip-bridge..."
mkdir -p "$BIN_DIR"
cp "$REPO_DIR/../bin/wayland-xclip-bridge" "$BIN_DIR/"
chmod +x "$BIN_DIR/wayland-xclip-bridge"

# ── 4. Desktop entry ─────────────────────────────────────────────────────────
echo "Creating desktop entry..."
mkdir -p "$APPS_DIR"
cat > "$APPS_DIR/freerapid.desktop" <<EOF
[Desktop Entry]
Name=FreeRapid Downloader
Exec=$INSTALL_DIR/frd.sh
Icon=$INSTALL_DIR/frd.png
Type=Application
Categories=Network;FileTransfer;
Terminal=false
EOF

echo ""
echo "Done. Add the clipboard bridge to Hyprland autostart if not already set:"
echo "  echo 'exec-once = wayland-xclip-bridge' >> ~/.config/hypr/hyprland.conf"
