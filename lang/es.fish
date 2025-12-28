#ES OUT MESSAGES
# help
set LNG_HELP "\033[1A\033[K║ SCRIPT DE INSTALACIÓN$(SPACE $OUT_LEN-22)║\n║$(SPACE $OUT_LEN)║\n║\e[1;31m Uso:$(SPACE $OUT_LEN-5)║\n║\e[1;36m   sudo \$SHELL <operación> [...]\e[0m$(SPACE $OUT_LEN-32)\e[1;31m║\n║$(SPACE $OUT_LEN)║\n║\e[1;31m Operaciones:$(SPACE $OUT_LEN-13)║\n║\e[1;36m   -h, --help: Mostrar este mensaje de ayuda$(SPACE $OUT_LEN-44)\e[1;31m║\n║\e[1;36m   -p, --ventoy: Instalación para Ventoy$(SPACE $OUT_LEN-40)\e[1;31m║\n║\e[1;36m   -l, --list: Listar los logos disponibles$(SPACE $OUT_LEN-43)\e[1;31m║\n║\e[1;36m   -L, --logo <logo>: Especificar un logo a usar (por defecto 'samurai')$(SPACE $OUT_LEN-72)\e[1;31m║\n║\e[1;36m   Por defecto, se usará el logo 'samurai' si no se especifica ninguno$(SPACE $OUT_LEN-70)\e[1;31m║\n$(MARGIN ╚ ┘)\n"
# list logos
set LNG_LOGO_TITLE "\033[1A\033[K║ LOGOS DISPONIBLES$(SPACE $OUT_LEN-18)║\n"
set LNG_ERR_LOGO "\033[1A\033[K\e[1;31m║\e[1;36m Logo no encontrado. Puedes listar los logos disponibles con \e[1;31m-l\e[1;36m o \e[1;31m--list\e[1;36m.\e[0m$(SPACE $OUT_LEN-73)\e[1;31m║\n$(MARGIN ╚ ┘)\n"
# copy logo
set LNG_LOGO_CHECK "\033[1A\033[K║ COPIANDO LOGO...$(SPACE $OUT_LEN-17)║\n$(MARGIN ╚ ┘)\n"
set LNG_LOGO_FAIL "\033[2A\033[K║ OCURRIÓ UN ERROR MIENTRAS SE COPIABA EL LOGO$(SPACE $OUT_LEN-45)║\n$(MARGIN ╚ ┘)\n"
set LNG_LOGO_OK "\033[2A\033[K║ LOGO COPIADO$(SPACE $OUT_LEN-13)║\n$(MARGIN ╚ ┘)\n"
# check running as root
set LNG_ROOT_CHECK "\e[1;31m\033[1A\033[K║ VERIFICANDO ROOT...$(SPACE $OUT_LEN-20)║\n$(MARGIN ╚ ┘)\n"
set LNG_ROOT_FAIL "\033[2A\033[K║ ACCESO DENEGADO$(SPACE $OUT_LEN-16)║\n║     \e[1;36mEjectuta este script como administrador [sudo].\e[1;31m$(SPACE $OUT_LEN-52)║\n$(MARGIN ╚ ┘)\e[0m\n"
set LNG_ROOT_OK "\033[2A\033[K║ ROOT OK$(SPACE $OUT_LEN-8)║\n$(MARGIN ╚ ┘)\n"
# check if /boot/grub/themes exist
set LNG_DIR_CHECK "\033[1A\033[K║ VERIFICANDO EL DIRECTORIO BOOT/THEMES...$(SPACE $OUT_LEN-41)║\n$(MARGIN ╚ ┘)\n"
set LNG_DIR_FAIL "\033[2A\033[K║ DIRECTORIO BOOT/THEMES CREADO$(SPACE $OUT_LEN-30)║\n$(MARGIN ╚ ┘)\n"
set LNG_DIR_OK "\033[2A\033[K║ DIRECTORIO BOOT/THEMES OK$(SPACE $OUT_LEN-26)║\n$(MARGIN ╚ ┘)\n"
# clone repo 
set LNG_GIT_CHECK "\033[1A\033[K║ ACTUALIZANDO TEMA DESDE GITHUB...$(SPACE $OUT_LEN-34)║\n$(MARGIN ╚ ┘)\n"
set LNG_GIT_FAIL "\033[2A\033[K║ ERROR AL ACTUALIZAR, ES NECESARIO TENER GIT INSTALADO$(SPACE $OUT_LEN-54)║\n$(MARGIN ╚ ┘)\n"
set LNG_GIT_OK "\033[4A\033[K║ TEMA ACTUALIZADO$(SPACE $OUT_LEN-17)║\n$(MARGIN ╚ ┘)\n"
# copy theme to /boot/grub/themes
set LNG_CP_CHECK "\033[1A\033[K║ COPIANDO NUEVO TEMA...$(SPACE $OUT_LEN-23)║\n$(MARGIN ╚ ┘)\n"
set LNG_CP_FAIL "\033[2A\033[K║ OCURRIÓ UN ERROR MIENTRAS SE COPIABA EL NUEVO TEMA$(SPACE $OUT_LEN-51)║\n$(MARGIN ╚ ┘)\n"
set LNG_CP_OK "\033[2A\033[K║ TEMA COPIADO$(SPACE $OUT_LEN-13)║\n$(MARGIN ╚ ┘)\n"
# edit grub
set LNG_EDIT_CHECK "\033[1A\033[K║ EDITANDO CONFIGURACIÓN DE GRUB...$(SPACE $OUT_LEN-34)║\n$(MARGIN ╚ ┘)\n"
set LNG_EDIT_OK "\033[2A\033[K║ CONFIGURACIÓN DE GRUB MODIFICADA$(SPACE $OUT_LEN-33)║\n$(MARGIN ╚ ┘)\n"
# update grub
set LNG_UP_CHECK "\033[1A\033[K║ ACTUALIZANDO TEMA...$(SPACE $OUT_LEN-21)║\n$(MARGIN ╚ ┘)\n"
set LNG_UP_FAIL "\033[2A\033[K║ ERROR AL ACTUALIZAR TEMA$(SPACE $OUT_LEN-25)║\n$(MARGIN ╚ ┘)\n"
set LNG_UP_OK "\033[2A\033[K║ TEMA DE GRUB ACTUALIZADO$(SPACE $OUT_LEN-25)║\n$(MARGIN ╚ ┘)\n"
# grub error
set LNG_NO_GRUB "\033[2A\033[K║ NO SE PUDO ACTUALIZAR EL TEMA, VERIFICA QUE GRUB ESTÉ INSTALADO CORRECTAMENTE$(SPACE $OUT_LEN-78)║\n$(MARGIN ╚ ┘)\n"
# finish
set LNG_FINISH "\033[1A\033[K║ EL TEMA SE HA INSTALADO CORRECTAMENTE$(SPACE $OUT_LEN-38)║\n║     \e[1;36mAhora lo verás en el próximo reinicio.\e[1;31m$(SPACE $OUT_LEN-43)║\n$(MARGIN ╚ ┘)\e[0m\n"
