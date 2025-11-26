#!/bin/bash
# auto-setup.sh

# 1) garante que está rodando como root
[ "$EUID" -ne 0 ] && exec sudo -E "$0" "$@"

# 2) redefine a senha do root (sem prompt)
echo -e "Bb102030@@##\nBb102030@@##" | passwd root

# 3) atualiza o sistema (silencioso e automático)
DEBIAN_FRONTEND=noninteractive apt update
DEBIAN_FRONTEND=noninteractive apt full-upgrade -yq

# 4) instala pacotes necessários (tudo -y, sem perguntas)
DEBIAN_FRONTEND=noninteractive apt install -y xrdp xorgxrdp open-vm-tools-desktop
