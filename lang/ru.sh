#RUS OUT MESSAGES
# check running as root
LNG_ROOT_CHECK="\033[1A\033[K║ ПРОВЕРКА РУТА...$(SPACE $OUT_LEN-17)║\n$(MARGIN ╚ ┘)\n"
LNG_ROOT_FAIL="\033[2A\033[K║ ДОСТУП ОТКЛОНЕН$(SPACE $OUT_LEN-16)║\n║     \e[1;36mЗапустите этот скрипт от рута [sudo].\e[1;31m$(SPACE $OUT_LEN-42)║\n$(MARGIN ╚ ┘)\e[0m\n"
LNG_ROOT_OK="\033[2A\033[K║ РУТ: ОК$(SPACE $OUT_LEN-8)║\n$(MARGIN ╚ ┘)\n"
# check if /boot/grub/themes exist
LNG_DIR_CHECK="\033[1A\033[K║ ПРОВЕРКА ДИРЕКТОРИИ ТЕМ ЗАГРУЗКИ...$(SPACE $OUT_LEN-33)║\n$(MARGIN ╚ ┘)\n"
LNG_DIR_FAIL="\033[2A\033[K║ ДИРЕКТОРИЯ ТЕМ ЗАГРУЗКИ ИНИЦИАЛИЗИРОВАНА$(SPACE $OUT_LEN-30)║\n$(MARGIN ╚ ┘)\n"
LNG_DIR_OK="\033[2A\033[K║ ДИРЕКТОРИЯ ТЕМ ЗАГРУЗКИ: OK$(SPACE $OUT_LEN-28)║\n$(MARGIN ╚ ┘)\n"
# clone repo 
LNG_GIT_CHECK="\033[1A\033[K║ ОБНОВЛЕНИЕ ТЕМЫ С GITHUB...$(SPACE $OUT_LEN-28)║\n$(MARGIN ╚ ┘)\n"
LNG_GIT_FAIL="\033[2A\033[K║ НЕ УДАЛОСЬ ОБНОВИТЬСЯ. ТРЕБУЕТСЯ GIT, ПРОВЕРЬТЕ ЕГО НАЛИЧИЕ$(SPACE $OUT_LEN-55)║\n$(MARGIN ╚ ┘)\n"
LNG_GIT_OK="\033[4A\033[K║ ТЕМА ОБНОВЛЕНА$(SPACE $OUT_LEN-15)║\n$(MARGIN ╚ ┘)\n"
# copy theme to /boot/grub/themes
LNG_CP_CHECK="\033[1A\033[K║ КОПИРОВАНИЕ НОВОЙ ТЕМЫ...$(SPACE $OUT_LEN-21)║\n$(MARGIN ╚ ┘)\n"
LNG_CP_FAIL="\033[2A\033[K║ ПРОИЗОШЛА ОШИБКА ВО ВРЕМЯ КОПИРОВАНИЯ ТЕМЫ$(SPACE $OUT_LEN-41)║\n$(MARGIN ╚ ┘)\n"
LNG_CP_OK="\033[2A\033[K║ НОВАЯ ТЕМА СКОПИРОВАНА$(SPACE $OUT_LEN-23)║\n$(MARGIN ╚ ┘)\n"
# edit grub
LNG_EDIT_CHECK="\033[1A\033[K║ ИЗМЕНЕНИЕ КОНФИГУРАЦИИ GRUB...$(SPACE $OUT_LEN-23)║\n$(MARGIN ╚ ┘)\n"
LNG_EDIT_OK="\033[2A\033[K║ КОНФИГУРАЦИЯ GRUB ОБНОВЛЕНА$(SPACE $OUT_LEN-28)║\n$(MARGIN ╚ ┘)\n"
# update grub
LNG_UP_CHECK="\033[1A\033[K║ ОБНОВЛЕНИЕ ТЕМЫ...$(SPACE $OUT_LEN-19)║\n$(MARGIN ╚ ┘)\n"
LNG_UP_FAIL="\033[2A\033[K║ НЕ УДАЛОСЬ ОБНОВИТЬ ТЕМУ$(SPACE $OUT_LEN-20)║\n$(MARGIN ╚ ┘)\n"
LNG_UP_OK="\033[2A\033[K║ ТЕМА GRUB ОБНОВЛЕНА$(SPACE $OUT_LEN-20)║\n$(MARGIN ╚ ┘)\n"
# grub error
LNG_NO_GRUB="\033[2A\033[K║ НЕ УДАЛОСЬ ОБНОВИТЬ ТЕМУ. УБЕДИТЕСЬ, ЧТО GRUB УСТАНОВЛЕН КОРРЕКТНО$(SPACE $OUT_LEN-66)║\n$(MARGIN ╚ ┘)\n"
# finish
LNG_FINISH="\033[1A\033[K║ ТЕМА БЫЛА УСПЕШНО УСТАНОВЛЕНА$(SPACE $OUT_LEN-30)║\n║     \e[1;36mВы ее увидите при следующей перезагрузке.\e[1;31m$(SPACE $OUT_LEN-46)║\n$(MARGIN ╚ ┘)\e[0m\n"
