#!/bin/zsh

THEME_NAME="CyberGRUB-2077"
THEME_URL="https://github.com/adnksharp/CyberGRUB-2077"
THEME_DIR="/boot/grub/themes"
GRUB_CFG="/etc/default/grub"
SYS_LANG="./lang/${LANG:0:2}.sh"

source ./scripts/outs.sh

printf "$OUT_TITLE"

# Set lang outs
if [ ! -f "$SYS_LANG" ]; then
	source ./lang/en.sh
else
	source "$SYS_LANG"
fi

# Check root
printf "$LNG_ROOT_CHECK"
# sleep 1
if [ "$EUID" -ne 0 ]; then
    printf "$LNG_ROOT_FAIL"
    exit 1
fi
printf "$LNG_ROOT_OK"

# Create THEME_DIR if it doesn't exist
printf "$LNG_DIR_CHECK"
# sleep 1
if [ ! -d "$THEME_DIR" ]; then
    mkdir -p "$THEME_DIR"
    printf "$LNG_DIR_FAIL"
else
    printf "$LNG_DIR_OK"
fi

# Copy theme
if [ ! -d "$THEME_DIR/$THEME_NAME" ]; then
    sudo cp -r $THEME_NAME/ $THEME_DIR
fi

# Modify GRUB
if grep -q "GRUB_THEME=" "$GRUB_CFG"; then
    sed -i "s|^GRUB_THEME=.*|GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\"|" "$GRUB_CFG"
else
    # Added extra line before the GRUB_THEME line
    echo "" >> "$GRUB_CFG"
    echo "GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\"" >>"$GRUB_CFG"
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
