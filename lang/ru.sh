#RUS OUT MESSAGES
# help
LNG_HELP="\033[1A\033[K║ СКРИПТ УСТАНОВКИ$(SPACE $OUT_LEN-17)║\n║$(SPACE $OUT_LEN)║\n║\e[1;31m Использование:$(SPACE $OUT_LEN-15)║\n║\e[1;36m   sudo \$SHELL $0 <операция> [...]\e[0m$(SPACE $OUT_LEN-44)\e[1;31m║\n║$(SPACE $OUT_LEN)║\n║\e[1;31m Операции:$(SPACE $OUT_LEN-10)║\n║\e[1;36m   -h, --help: Показать это сообщение помощи$(SPACE $OUT_LEN-44)\e[1;31m║\n║\e[1;36m   -l, --list: Показать доступные логотипы$(SPACE $OUT_LEN-42)\e[1;31m║\n║\e[1;36m   -L, --logo <logo>: Указать логотип для использования$(SPACE $OUT_LEN-55)\e[1;31m║\n║\e[1;36m   По умолчанию будет использоваться логотип 'samurai', если не указан другой$(SPACE $OUT_LEN-77)\e[1;31m║\n$(MARGIN ╚ ┘)\n"
# list logos
LNG_LOGO_TITLE="\033[1A\033[K║ ДОСТУПНЫЕ ЛОГОТИПЫ$(SPACE $OUT_LEN-19)║\n"
LNG_ERR_LOGO="\033[1A\033[K\e[1;31m║\e[1;36m Логотип не найден.\e[0m$(SPACE $OUT_LEN-19)\e[1;31m║\n║\e[1;36m  Вы можете просмотреть доступные логотипы с помощью \e[1;31m-l\e[1;36m или \e[1;31m--list\e[1;36m.\e[0m$(SPACE $OUT_LEN-67)\e[1;31m║\n$(MARGIN ╚ ┘)\n"
# copy logo
LNG_LOGO_CHECK="\033[1A\033[K║ КОПИРОВАНИЕ ЛОГОТИПА...$(SPACE $OUT_LEN-24)║\n$(MARGIN ╚ ┘)\n"
LNG_LOGO_FAIL="\033[2A\033[K║ ПРОИЗОШЛА ОШИБКА ВО ВРЕМЯ КОПИРОВАНИЯ ЛОГОТИПА$(SPACE $OUT_LEN-47)║\n$(MARGIN ╚ ┘)\n"
LNG_LOGO_OK="\033[2A\033[K║ ЛОГОТИП СКОПИРОВАН$(SPACE $OUT_LEN-19)║\n$(MARGIN ╚ ┘)\n"
# check running as root
LNG_ROOT_CHECK="\033[1A\033[K║ ПРОВЕРКА РУТА...$(SPACE $OUT_LEN-17)║\n$(MARGIN ╚ ┘)\n"
LNG_ROOT_FAIL="\033[2A\033[K║ ДОСТУП ОТКЛОНЕН$(SPACE $OUT_LEN-16)║\n║     \e[1;36mЗапустите этот скрипт от рута [sudo].\e[1;31m$(SPACE $OUT_LEN-42)║\n$(MARGIN ╚ ┘)\e[0m\n"
LNG_ROOT_OK="\033[2A\033[K║ РУТ: OK$(SPACE $OUT_LEN-8)║\n$(MARGIN ╚ ┘)\n"
# check if /boot/grub/themes exist
LNG_DIR_CHECK="\033[1A\033[K║ ПРОВЕРКА ДИРЕКТОРИИ ТЕМ ЗАГРУЗКИ...$(SPACE $OUT_LEN-33)║\n$(MARGIN ╚ ┘)\n"
LNG_DIR_FAIL="\033[2A\033[K║ ДИРЕКТОРИЯ ТЕМ ЗАГРУЗКИ ИНИЦИАЛИЗИРОВАНА$(SPACE $OUT_LEN-41)║\n$(MARGIN ╚ ┘)\n"
LNG_DIR_OK="\033[2A\033[K║ ДИРЕКТОРИЯ ТЕМ ЗАГРУЗКИ: OK$(SPACE $OUT_LEN-28)║\n$(MARGIN ╚ ┘)\n"
# clone repo 
LNG_GIT_CHECK="\033[1A\033[K║ ОБНОВЛЕНИЕ ТЕМЫ С GITHUB...$(SPACE $OUT_LEN-28)║\n$(MARGIN ╚ ┘)\n"
LNG_GIT_FAIL="\033[2A\033[K║ НЕ УДАЛОСЬ ОБНОВИТЬСЯ. ТРЕБУЕТСЯ GIT, ПРОВЕРЬТЕ ЕГО НАЛИЧИЕ$(SPACE $OUT_LEN-60)║\n$(MARGIN ╚ ┘)\n"
LNG_GIT_OK="\033[4A\033[K║ ТЕМА ОБНОВЛЕНА$(SPACE $OUT_LEN-15)║\n$(MARGIN ╚ ┘)\n"
# copy theme to /boot/grub/themes
LNG_CP_CHECK="\033[1A\033[K║ КОПИРОВАНИЕ НОВОЙ ТЕМЫ...$(SPACE $OUT_LEN-25)║\n$(MARGIN ╚ ┘)\n"
LNG_CP_FAIL="\033[2A\033[K║ ПРОИЗОШЛА ОШИБКА ВО ВРЕМЯ КОПИРОВАНИЯ ТЕМЫ$(SPACE $OUT_LEN-43)║\n$(MARGIN ╚ ┘)\n"
LNG_CP_OK="\033[2A\033[K║ НОВАЯ ТЕМА СКОПИРОВАНА$(SPACE $OUT_LEN-23)║\n$(MARGIN ╚ ┘)\n"
# edit grub
LNG_EDIT_CHECK="\033[1A\033[K║ ИЗМЕНЕНИЕ КОНФИГУРАЦИИ GRUB...$(SPACE $OUT_LEN-31)║\n$(MARGIN ╚ ┘)\n"
LNG_EDIT_OK="\033[2A\033[K║ КОНФИГУРАЦИЯ GRUB OБНОВЛЕНА$(SPACE $OUT_LEN-28)║\n$(MARGIN ╚ ┘)\n"
# update grub
LNG_UP_CHECK="\033[1A\033[K║ ОБНОВЛЕНИЕ ТЕМЫ...$(SPACE $OUT_LEN-19)║\n$(MARGIN ╚ ┘)\n"
LNG_UP_FAIL="\033[2A\033[K║ НЕ УДАЛОСЬ ОБНОВИТЬ ТЕМУ$(SPACE $OUT_LEN-25)║\n$(MARGIN ╚ ┘)\n"
LNG_UP_OK="\033[2A\033[K║ ТЕМА GRUB ОБНОВЛЕНА$(SPACE $OUT_LEN-20)║\n$(MARGIN ╚ ┘)\n"
# grub error
LNG_NO_GRUB="\033[2A\033[K║ НЕ УДАЛОСЬ ОБНОВИТЬ ТЕМУ. УБЕДИТЕСЬ, ЧТО GRUB УСТАНОВЛЕН КОРРЕКТНО$(SPACE $OUT_LEN-69)║\n$(MARGIN ╚ ┘)\n"
# finish
LNG_FINISH="\033[1A\033[K║ ТЕМА БЫЛА УСПЕШНО УСТАНОВЛЕНА$(SPACE $OUT_LEN-30)║\n║     \e[1;36mВы ее увидите при следующей перезагрузке.\e[1;31m$(SPACE $OUT_LEN-46)║\n$(MARGIN ╚ ┘)\e[0m\n"
