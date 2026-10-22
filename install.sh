#!/usr/bin/env bash
#
# wired-desktop installer
# "present day, present time · the wired is open"
# Serial Experiments Lain & Cyberpunk aesthetic for LXDE/Openbox
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=========================================="
echo "          WIRED DESKTOP INSTALLER         "
echo " present day, present time · wired is open"
echo "=========================================="

echo "[1/6] Installing themes, icons, wallpapers and sounds..."
mkdir -p "$HOME/.themes"
mkdir -p "$HOME/.local/share/icons"
mkdir -p "$HOME/.local/share/wallpapers"
mkdir -p "$HOME/.local/share/sounds"

cp -r "$SCRIPT_DIR/themes/wired" "$HOME/.themes/"
cp -r "$SCRIPT_DIR/icons/wired" "$HOME/.local/share/icons/"
cp -r "$SCRIPT_DIR/wallpapers/wired.png" "$HOME/.local/share/wallpapers/"
cp -r "$SCRIPT_DIR/sounds/wired" "$HOME/.local/share/sounds/"

echo "[2/6] Installing CLI utilities & scripts in ~/.local/bin..."
mkdir -p "$HOME/.local/bin"
cp "$SCRIPT_DIR/bin/"* "$HOME/.local/bin/"
chmod +x "$HOME/.local/bin/"*

echo "[3/6] Installing desktop and application configurations..."
mkdir -p "$HOME/.config/openbox"
mkdir -p "$HOME/.config/lxpanel/LXDE/panels"
mkdir -p "$HOME/.config/lxsession/LXDE"
mkdir -p "$HOME/.config/pcmanfm/LXDE"
mkdir -p "$HOME/.config/gtk-3.0"
mkdir -p "$HOME/.config/gtk-4.0"
mkdir -p "$HOME/.config/menus"
mkdir -p "$HOME/.local/share/desktop-directories"
mkdir -p "$HOME/.local/share/applications"

cp "$SCRIPT_DIR/config/openbox/"* "$HOME/.config/openbox/"
cp "$SCRIPT_DIR/config/lxpanel/panel" "$HOME/.config/lxpanel/LXDE/panels/"
cp "$SCRIPT_DIR/config/lxsession/desktop.conf" "$HOME/.config/lxsession/LXDE/"
cp "$SCRIPT_DIR/config/pcmanfm/"* "$HOME/.config/pcmanfm/LXDE/"
cp "$SCRIPT_DIR/config/gtk-3.0/"* "$HOME/.config/gtk-3.0/"
[ -d "$SCRIPT_DIR/config/gtk-4.0" ] && cp "$SCRIPT_DIR/config/gtk-4.0/"* "$HOME/.config/gtk-4.0/" || true
cp "$SCRIPT_DIR/config/menus/"* "$HOME/.config/menus/"
cp "$SCRIPT_DIR/config/desktop-directories/"* "$HOME/.local/share/desktop-directories/"
cp "$SCRIPT_DIR/config/applications/"* "$HOME/.local/share/applications/"

echo "[4/6] Updating caches..."
update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
gtk-update-icon-cache -f "$HOME/.local/share/icons/wired" 2>/dev/null || true

echo "[5/6] Checking ~/.bashrc prompt..."
if ! grep -q "the wired is open" "$HOME/.bashrc" 2>/dev/null; then
    echo "Adding wired prompt and banner to ~/.bashrc..."
    cat "$SCRIPT_DIR/config/bashrc-wired.sh" >> "$HOME/.bashrc"
fi

echo "[6/6] System components (GRUB, Plymouth, Logout)..."
if [ "${1:-}" = "--system" ] || [ "${1:-}" = "-s" ]; then
    echo "Installing system-wide components (requires sudo)..."
    if [ -d "$SCRIPT_DIR/system/grub/wired" ]; then
        sudo mkdir -p /boot/grub/themes/wired
        sudo cp -r "$SCRIPT_DIR/system/grub/wired/"* /boot/grub/themes/wired/
        sudo sed -i 's/^GRUB_DISTRIBUTOR=.*/GRUB_DISTRIBUTOR="wired"/' /etc/default/grub
        sudo update-grub
    fi
    if [ -d "$SCRIPT_DIR/system/plymouth/wired" ]; then
        sudo mkdir -p /usr/share/plymouth/themes/wired
        sudo cp -r "$SCRIPT_DIR/system/plymouth/wired/"* /usr/share/plymouth/themes/wired/
        sudo update-initramfs -u
    fi
    if [ -f "$SCRIPT_DIR/system/scripts/lxde-logout" ]; then
        sudo cp "$SCRIPT_DIR/system/scripts/lxde-logout" /usr/bin/lxde-logout
        sudo chmod +x /usr/bin/lxde-logout
    fi
    if [ -f "$SCRIPT_DIR/system/os-release/os-release" ]; then
        sudo cp "$SCRIPT_DIR/system/os-release/os-release" /etc/os-release
    fi
else
    echo "Skipping system components. To install GRUB, Plymouth and system branding, run: ./install.sh --system"
fi

echo ""
echo "Installation complete! To apply changes now:"
echo "  openbox --reconfigure"
echo "  DISPLAY=:0 lxpanelctl restart"
echo ""
