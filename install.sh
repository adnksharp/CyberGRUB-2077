#!/bin/bash

THEME_NAME="CyberGRUB-2077"
THEME_URL="https://github.com/adnksharp/CyberGRUB-2077"
THEME_DIR="/boot/grub/themes"
GRUB_CFG="/etc/default/grub"

# Check root
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root (sudo)"
    exit 1
fi

# Create THEME_DIR if it doesn't exist
if [ ! -d "$THEME_DIR" ]; then
    sudo mkdir -p "$THEME_DIR"
fi

# Copy theme
if [ ! -d "$THEME_DIR/$THEME_NAME" ]; then
    sudo cp -r $THEME_NAME /$THEME_DIR
fi

# Modify GRUB
if grep -q "GRUB_THEME=" "$GRUB_CFG"; then
    sed -i "s|^GRUB_THEME=.*|GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\"|" "$GRUB_CFG"
else
    echo "GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\"" >> "$GRUB_CFG"
fi

# Updating GRUB
echo "Updating GRUB..."
if command -v grub-mkconfig >/dev/null 2>&1; then
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    if [ $? -ne 0 ]; then
        echo "Error updating GRUB."
        exit 1
    fi
else
    echo "The command grub-mkconfig is not available. Please ensure GRUB is properly installed."
    exit 1
fi

echo "The theme has been installed succesfully. You will now see it at the next reboot"