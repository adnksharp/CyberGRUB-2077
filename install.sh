#!/bin/bash

THEME_NAME="CyberGRUB-2077"
THEME_URL="https://github.com/adnksharp/CyberGRUB-2077"
THEME_DIR="/boot/grub/themes"
GRUB_CFG="/etc/default/grub"
SYS_LANG="./lang/${LANG:0:2}.sh"
LOGO="samurai"

source ./scripts/outs.sh

printf "$OUT_TITLE"

# Set lang outs
if [ ! -f "$SYS_LANG" ]; then
	source ./lang/en.sh
else
	source "$SYS_LANG"
fi

# Check options
OPTS=$(getopt --options "hlL:" --longoptions "help,list,logo:" --name "$0" -- "$@")

if [ $? -ne 0 ]; then
	printf "\033[1A\033[K"
	exit 1
fi

eval set -- "$OPTS"

while true; do
	case "$1" in
		-h|--help)
			printf "$LNG_HELP"
			exit 0
			;;
		-l|--list)
			# List available logos from the img/logos directory
			LOGOS="$(ls -l ./img/logos | awk '/^-/ {print $9}' | sed 's/\.png$//')"
			LOGOS=($(echo "$LOGOS" | tr ' ' '\n'))

			printf "$LNG_LOGO_TITLE"
			
			for ((i=1; i<=${#LOGOS[@]}; i++)); do
				if (((i - 1) % 5 == 0)); then
					printf "\e[1;31m║\e[1;36m"
				fi
				printf "  ${LOGOS[i]}"
				for ((j=${#LOGOS[i]}; j<13; j++)); do
					printf " "
				done
				if (((i) % 5 == 0)); then
					printf " \e[1;31m║\e[0m\n"
				else
					printf " "
				fi
			done
			if [ $(( ${#LOGOS[@]} % 5 )) -ne 0 ]; then
				LLL=$((${#LOGOS[@]} % 5 * 16))
				printf "$(SPACE $OUT_LEN-$LLL)\e[1;31m║\n$(MARGIN ╚ ┘)\e[0m\n"
			else
				printf "\e[1;31m$(MARGIN ╚ ┘)\e[0m\n"
			fi
			exit 0
			;;
		-L|--logo)
			# LOGO="$2"
			# Check if the logo exists
			if [[ ! -f "./img/logos/${2}.png" ]]; then
				printf "$LNG_ERR_LOGO"
				exit 1
			else
				LOGO="$2"
				printf "\033[1A\033[K║ [\e[1;36m$LOGO\e[1;31m] $(SPACE $OUT_LEN-$((${#LOGO} + 4)))║\n\e[1;31m$(MARGIN ╚ ┘)\n"
			fi
			shift 2
			;;
		--)
			shift
			break
			;;
		*)
			printf "$LNG_ERR_OPT"
			exit 1
			;;
	esac
done

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

# Copy logo.png to theme directory
printf "$LNG_LOGO_CHECK"
# sleep 2
cp -f "./img/logos/${LOGO}.png" "${THEME_DIR}/${THEME_NAME}/logo.png" > /dev/null 2>&1
if [ $? -eq 0 ]; then
	printf "$LNG_LOGO_OK"
else
	printf "$LNG_LOGO_FAIL"
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
