#!/bin/sh

THEME_NAME="CyberGRUB-2077"
THEME_URL="https://github.com/adnksharp/CyberGRUB-2077"

GRUB_ALIAS="grub"
SYS_LANG="./lang/${LANG:0:2}.sh"

source ./scripts/outs.sh

printf "$OUT_TITLE"

# Get distro
if [ -f /etc/os-release ]; then
	. /etc/os-release
	DISTRO=$ID
elif [ -f /etc/lsb-release ]; then
	. /etc/lsb-release
	DISTRO=$DISTRIB_ID
elif [ -f /etc/debian_version ]; then
	DISTRO="debian"
elif [ -f /etc/redhat-release ]; then
	DISTRO="rhel"
else
	DISTRO="linux"
fi

# Define grub | grub2 to use
if command -v grub2-mkconfig > /dev/null 2>&1 && [ -d "/boot/grub2" ]; then
	GRUB_ALIAS="grub2"
	GRUB_COMMAND="grub2-mkconfig"
elif command -v grub-mkconfig > /dev/null 2>&1 && [ -d "/boot/grub" ]; then
	GRUB_ALIAS="grub"
	GRUB_COMMAND="grub-mkconfig"
else
	printf "$LNG_NO_GRUB"
	exit 1
fi

THEME_DIR="/boot/${GRUBZorin_ALIAS}/themes"
GRUB_CFG="/etc/default/grub"

# Set lang outs
if [ ! -f "$SYS_LANG" ]; then
	source ./lang/en.sh
else
	source "$SYS_LANG"
fi

# Check options
OPTS=$(getopt --options "hplL:" --longoptions "help,ventoy,list,logo:" --name "$0" -- "$@")

if [ $? -ne 0 ]; then
	printf "\033[1A\033[K"
	exit 1
fi

LOGO='samurai'

eval set -- "$OPTS"

while true; do
	case "$1" in
		-h|--help)
			printf "$LNG_HELP"
			exit 0
			;;
		-l|--list)
			# List available logos from the img/logos directory
			LOGOS="$(find ./img/logos -type f -printf '%f\n')"
			LOGOS=($(echo "$LOGOS" | tr ' ' '\n'))

			printf "$LNG_LOGO_TITLE"
			
			for ((i=1; i<=${#LOGOS[@]}; i++)); do
				if (((i - 1) % 4 == 0)); then
					printf "\e[1;31m║\e[1;36m"
				fi
				printf "  ${LOGOS[i]}"
				for ((j=${#LOGOS[i]}; j<17; j++)); do
					printf " "
				done
				if (((i) % 4 == 0)); then
					printf " \e[1;31m║\e[0m\n"
				else
					printf " "
				fi
			done
			if [ $(( ${#LOGOS[@]} % 4 )) -ne 0 ]; then
				LLL=$((${#LOGOS[@]} % 4 * 20))
				printf "$(SPACE $OUT_LEN-$LLL)\e[1;31m║\n$(MARGIN ╚ ┘)\e[0m\n"
			else
				printf "\e[1;31m$(MARGIN ╚ ┘)\e[0m\n"
			fi
			exit 0
			;;
		-p|--ventoy)
			THEME_DIR="Ventoy"
			
			mkdir -p "${THEME_DIR}/themes"
			cp -r $THEME_NAME "${THEME_DIR}/themes" > /dev/null 2>&1
			cp -f "./img/logos/${LOGO}.png" "${THEME_DIR}/themes/${THEME_NAME}/logo.png" > /dev/null 2>&1
			cp -f "./ventoy.json" "${THEME_DIR}/ventoy.json" > /dev/null 2>&1

			exit 0
			;;
		-L|--logo)
			# LOGO="$2"
			if [[ ! -f "./img/logos/${2}.png" ]]; then
				printf "$LNG_ERR_LOGO"
				exit 1
			else
				LOGO="$2"
			fi
			shift 2
			;;
		--)
			shift
			break
			;;
		*)
			printf "<BAD>"
			exit 1
			;;
	esac
done

printf "\033[1A\033[K║ [\e[1;36m$LOGO\e[1;31m] $(SPACE $OUT_LEN-$((${#LOGO} + 4)))║\n\e[1;31m$(MARGIN ╚ ┘)\n"

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
	#git reset --hard 
	#git pull --rebase
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

# UPDATE GRUB CFG
GRUB_THEME_PATH="GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\""
printf "$LNG_EDIT_CHECK"
# sleep 4
# Update THEME
if grep -qE "^#?GRUB_THEME=" "$GRUB_CFG"; then
	sed -i -E "s|^#?GRUB_THEME=.*|$GRUB_THEME_PATH|" "$GRUB_CFG"
else
	echo "" >> "$GRUB_CFG"
	echo "$GRUB_THEME_PATH" >> "$GRUB_CFG"
fi

# Update TERMINAL_OUTPUT
sed -i 's/^GRUB_TERMINAL_OUTPUT=/#GRUB_TERMINAL_OUTPUT=/' "$GRUB_CFG"

# Check GFXMODE
if grep -qE "^#?GRUB_GFXMODE=" "$GRUB_CFG"; then
    sed -i -E "s|^#?GRUB_GFXMODE=.*|GRUB_GFXMODE=auto|" "$GRUB_CFG"
else
    echo "GRUB_GFXMODE=auto" >> "$GRUB_CFG"
fi
sed -i 's/^#GRUB_GFXMODE=/GRUB_GFXMODE=/' "$GRUB_CFG"

# Check GFXPAYLOAD
if grep -qE "^#?GRUB_GFXPAYLOAD_LINUX=" "$GRUB_CFG"; then
    sed -i -E "s|^#?GRUB_GFXPAYLOAD_LINUX=.*|GRUB_GFXPAYLOAD_LINUX=keep|" "$GRUB_CFG"
else
    echo "GRUB_GFXPAYLOAD_LINUX=keep" >> "$GRUB_CFG"
fi
sed -i 's/^#GRUB_GFXPAYLOAD_LINUX=/GRUB_GFXPAYLOAD_LINUX=/' "$GRUB_CFG"

printf "$LNG_EDIT_OK"

# Updating GRUB
printf "$LNG_UP_CHECK"
GRUB_CONFIG_PATH="/boot/${GRUB_ALIAS}/grub.cfg"
sudo "${GRUB_COMMAND}" -o "${GRUB_CONFIG_PATH}" > /dev/null 2>&1
if [ $? -ne 0 ]; then
	printf "$LNG_UP_FAIL"
	exit 1
fi
printf "$LNG_UP_OK"

printf "$LNG_FINISH"
