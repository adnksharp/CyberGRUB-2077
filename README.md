# CyberGRUB-2077

![](https://i.imgur.com/EgtSwVk.png)

Tema de GRUB inspirado en Cyberpunk 2077.

## Instalación
1. Descargar y descomprimir [CyberGRUB-2077.tar.gz](https://github.com/adnksharp/CyberGRUB-2077/releases/download/firts/CyberGRUB-2077.tar.gz).
2. Mover la carpeta `CyberGRUB-2077` a `/boot/grub/themes/` como administrador.
3. Actualizar la configuración de GRUB (`/etc/default/grub`) con:
```bash
GRUB_THEME=/boot/grub/themes/CyberGRUB-2077/theme.txt
```
4. Actualizar GRUB:
```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
