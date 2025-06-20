#PT OUT MESSAGES
# help
LNG_HELP="\033[1A\033[K║ SCRIPT DE INSTALAÇÃO$(SPACE $OUT_LEN-21)║\n║$(SPACE $OUT_LEN)║\n║\e[1;31m Uso:$(SPACE $OUT_LEN-5)║\n║\e[1;36m   sudo \$SHELL $0 <operação> [...]\e[0m$(SPACE $OUT_LEN-44)\e[1;31m║\n║$(SPACE $OUT_LEN)║\n║\e[1;31m Operações:$(SPACE $OUT_LEN-11)║\n║\e[1;36m   -h, --help: Mostrar esta mensagem de ajuda$(SPACE $OUT_LEN-45)\e[1;31m║\n║\e[1;36m   -l, --list: Listar os logos disponíveis$(SPACE $OUT_LEN-42)\e[1;31m║\n║\e[1;36m   -L, --logo <logo>: Especificar um logo a usar$(SPACE $OUT_LEN-48)\e[1;31m║\n║\e[1;36m   Por padrão, o logo 'samurai' será usado se nenhum for especificado$(SPACE $OUT_LEN-69)\e[1;31m║\n$(MARGIN ╚ ┘)\n"
# list logos
LNG_LOGO_TITLE="\033[1A\033[K║ LOGOS DISPONÍVEIS$(SPACE $OUT_LEN-18)║\n"
LNG_ERR_LOGO="\033[1A\033[K\e[1;31m║\e[1;36m Logo não encontrado. Você pode listar os logos disponíveis com \e[1;31m-l\e[1;36m ou \e[1;31m--list\e[1;36m.\e[0m$(SPACE $OUT_LEN-77)\e[1;31m║\n$(MARGIN ╚ ┘)\n"
# copy logo
LNG_LOGO_CHECK="\033[1A\033[K║ COPIANDO LOGO...$(SPACE $OUT_LEN-17)║\n$(MARGIN ╚ ┘)\n"
LNG_LOGO_FAIL="\033[2A\033[K║ OCORREU UM ERRO AO COPIAR O LOGO$(SPACE $OUT_LEN-33)║\n$(MARGIN ╚ ┘)\n"
LNG_LOGO_OK="\033[2A\033[K║ LOGO COPIADO$(SPACE $OUT_LEN-13)║\n$(MARGIN ╚ ┘)\n"
# check running as root
LNG_ROOT_CHECK="\033[1A\033[K║ VERIFICANDO ROOT...$(SPACE $OUT_LEN-20)║\n$(MARGIN ╚ ┘)\n"
LNG_ROOT_FAIL="\033[2A\033[K║ ACESSO NEGADO$(SPACE $OUT_LEN-14)║\n║     \e[1;36mExecute este script como administrador [sudo].\e[1;31m$(SPACE $OUT_LEN-51)║\n$(MARGIN ╚ ┘)\e[0m\n"
LNG_ROOT_OK="\033[2A\033[K║ ROOT OK$(SPACE $OUT_LEN-8)║\n$(MARGIN ╚ ┘)\n"
# check if /boot/grub/themes exist
LNG_DIR_CHECK="\033[1A\033[K║ VERIFICANDO O DIRETÓRIO BOOT/THEMES...$(SPACE $OUT_LEN-39)║\n$(MARGIN ╚ ┘)\n"
LNG_DIR_FAIL="\033[2A\033[K║ DIRETÓRIO BOOT/THEMES CRIADO$(SPACE $OUT_LEN-29)║\n$(MARGIN ╚ ┘)\n"
LNG_DIR_OK="\033[2A\033[K║ DIRETÓRIO BOOT/THEMES OK$(SPACE $OUT_LEN-25)║\n$(MARGIN ╚ ┘)\n"
# clone repo 
LNG_GIT_CHECK="\033[1A\033[K║ ATUALIZANDO TEMA DO GITHUB...$(SPACE $OUT_LEN-30)║\n$(MARGIN ╚ ┘)\n"
LNG_GIT_FAIL="\033[2A\033[K║ FALHA AO ATUALIZAR. GIT NECESSÁRIO, VERIFIQUE SE ESTÁ INSTALADO$(SPACE $OUT_LEN-64)║\n$(MARGIN ╚ ┘)\n"
LNG_GIT_OK="\033[4A\033[K║ TEMA ATUALIZADO$(SPACE $OUT_LEN-16)║\n$(MARGIN ╚ ┘)\n"
# copy theme to /boot/grub/themes
LNG_CP_CHECK="\033[1A\033[K║ COPIANDO NOVO TEMA...$(SPACE $OUT_LEN-22)║\n$(MARGIN ╚ ┘)\n"
LNG_CP_FAIL="\033[2A\033[K║ OCORREU UM ERRO AO COPIAR O NOVO TEMA$(SPACE $OUT_LEN-38)║\n$(MARGIN ╚ ┘)\n"
LNG_CP_OK="\033[2A\033[K║ NOVO TEMA COPIADO$(SPACE $OUT_LEN-18)║\n$(MARGIN ╚ ┘)\n"
# edit grub
LNG_EDIT_CHECK="\033[1A\033[K║ EDITANDO CONFIGURAÇÃO DO GRUB...$(SPACE $OUT_LEN-33)║\n$(MARGIN ╚ ┘)\n"
LNG_EDIT_OK="\033[2A\033[K║ CONFIGURAÇÃO DO GRUB MODIFICADA$(SPACE $OUT_LEN-32)║\n$(MARGIN ╚ ┘)\n"
# update grub
LNG_UP_CHECK="\033[1A\033[K║ ATUALIZANDO TEMA...$(SPACE $OUT_LEN-20)║\n$(MARGIN ╚ ┘)\n"
LNG_UP_FAIL="\033[2A\033[K║ FALHA AO ATUALIZAR TEMA$(SPACE $OUT_LEN-24)║\n$(MARGIN ╚ ┘)\n"
LNG_UP_OK="\033[2A\033[K║ TEMA DO GRUB ATUALIZADO$(SPACE $OUT_LEN-24)║\n$(MARGIN ╚ ┘)\n"
# grub error
LNG_NO_GRUB="\033[2A\033[K║ FALHA AO ATUALIZAR TEMA, VERIFIQUE SE O GRUB ESTÁ INSTALADO CORRETAMENTE$(SPACE $OUT_LEN-73)║\n$(MARGIN ╚ ┘)\n"
# finish
LNG_FINISH="\033[1A\033[K║ O TEMA FOI INSTALADO COM SUCESSO$(SPACE $OUT_LEN-33)║\n║     \e[1;36mAgora você o verá na próxima reinicialização.\e[1;31m$(SPACE $OUT_LEN-50)║\n$(MARGIN ╚ ┘)\e[0m\n"
