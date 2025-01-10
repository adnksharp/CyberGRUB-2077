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
# sleep 2
if [ "$EUID" -ne 0 ]; then
    printf "$LNG_ROOT_FAIL"
    exit 1
fi
printf "$LNG_ROOT_OK"

# Create THEME_DIR if it doesn't exist
printf "$LNG_DIR_CHECK"
# sleep 2
if [ ! -d "$THEME_DIR" ]; then
    mkdir -p "$THEME_DIR"
    printf "$LNG_DIR_FAIL"
else
    printf "$LNG_DIR_OK"
fi

# update repo with git
printf "$LNG_GIT_CHECK"
# sleep 2
if command -v git >/dev/null 2>&1; then
    git reset --hard 
    git pull --rebase
    printf "$LNG_GIT_OK"
else
    printf "$LNG_GIT_FAIL"
    exit 1
fi

# Copy theme
printf "$LNG_CP_CHECK"
# sleep 2
cp -r $THEME_NAME $THEME_DIR > /dev/null 2>&1 
if [ $? -eq 0 ]; then
	printf "$LNG_CP_OK"
else
	printf "$LNG_CP_FAIL"
	exit 1
fi

# Modify GRUB
printf "$LNG_EDIT_CHECK"
# sleep 4
if grep -q "GRUB_THEME=" "$GRUB_CFG"; then
    sed -i "s|^GRUB_THEME=.*|GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\"|" "$GRUB_CFG"
else
    # Added extra line before the GRUB_THEME line
    echo "" >> "$GRUB_CFG"
    echo "GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\"" >>"$GRUB_CFG"
fi
printf "$LNG_EDIT_OK"

# Updating GRUB
printf "$LNG_UP_CHECK"
if command -v grub-mkconfig > /dev/null 2>&1; then
    sudo grub-mkconfig -o /boot/grub/grub.cfg > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        printf "$LNG_UP_FAIL"
        exit 1
    fi
    printf "$LNG_UP_OK"
else
    printf "$LNG_NO_GRUB"
    exit 1
fi

printf "$LNG_FINISH"
