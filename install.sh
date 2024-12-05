#!/usr/bin/env sh

BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

BRIGHT_BLACK="\033[90m"
BRIGHT_RED="\033[91m"
BRIGHT_GREEN="\033[92m"
BRIGHT_YELLOW="\033[93m"
BRIGHT_BLUE="\033[94m"
BRIGHT_MAGENTA="\033[95m"
BRIGHT_CYAN="\033[96m"
BRIGHT_WHITE="\033[97m"

RESET="\033[0m"

secure_install_fedora() {
	local to_install=42
	if [ $(dnf list installed 2> /dev/null | rg btop | wc -l)  = 0 ]; then
		echo -e "${RED}Error:\n${BRIGHT_RED}The installation of $1 is already done."
		return
	fi
	while [ "$to_install" != "n" ] && [ "$to_install" != "no" ] && [ "$to_install" != "y" ] && [ "$to_install" != "yes" ]; do
		echo -e "${CYAN}Do you want install:\n${BRIGHT_CYAN}$1 ?"
		echo -e "${CYAN}(yes [y] / no [n]):${RESET}"
		read to_install
		echo -e "\n"
	done
	clear
	if [ "$to_install" = "y" ] || [ "$to_install" = "yes" ]; then
		echo -e "${BRIGHT_GREEN}Installation of ${BRIGHT_GREEN}$1 ${GREEN}Done !${RESET}"
	else
		echo -e "${BRIGHT_GREEN}Installation of ${BRIGHT_GREEN}$1 ${GREEN}Skipped !${RESET}"
	fi
}

secure_copy() {
	if [ -d $HOME/.config/$1 ]; then
		echo -e "${RED}Error:\n${BRIGHT_RED}The confiuration of $1 is already existing !\n${RED}Want suppress it ?\n${RESET}"
		while [ "$confirmation" != "n" ] && [ "$confirmation" != "no" ] && [ "$confirmation" != "y" ] && [ "$confirmation" != "yes" ]; do
			echo -e "${RED}(yes [y] / no [n]):${RESET}"
			read confirmation
			echo -e "\n"
		done
		clear
		if [ "$confirmation" = "y" ] || [ "$confirmation" = "yes" ]; then
			cp -r ./$1 ./$HOME/.config/
			echo -e "${BRIGHT_GREEN}Installation of ${BRIGHT_GREEN}$1 ${GREEN}Done !${RESET}"
		else
			echo -e "${BRIGHT_GREEN}Installation of ${BRIGHT_GREEN}$1 ${GREEN}Skipped !${RESET}"
		fi
	else
		cp -r ./$1 ./$HOME/.config/
		echo -e "${BRIGHT_GREEN}Installation of ${BRIGHT_GREEN}$1 ${GREEN}Done !${RESET}"
	fi
	confirmation=42
}


if [ -z $1 ]; then
	echo -e "${BRIGHT_YELLOW}Please use a flag\n${RESET}"
	echo -e "${BRIGHT_YELLOW}For ${BLUE}Fedora\n'-f'${BRIGHT_YELLOW}, ${BLUE}'--fedora' ${BRIGHT_YELLOW}or ${BLUE}'fedora'\n${RESET}"
	echo -e "${BRIGHT_YELLOW}For ${BRIGHT_BLUE}NixOs\n'-n'${BRIGHT_YELLOW}, ${BRIGHT_BLUE}'--nixos' ${BRIGHT_YELLOW}or ${BRIGHT_BLUE}'nixos'\n${RESET}"
fi

if [ "$1" = "fedora" ]  ||  [ "$1" = "--fedora" ] || [ "$1" = "-f" ]; then
	secure_install_fedora "btop"
	if [ to_install = "y" ] || [ to_install = "yes" ]; then
		dnf install btop -y
	fi
	secure_copy "btop"

	secure_install_fedora "hyprland"
	if [ to_install = "y" ] || [ to_install = "yes" ]; then
		sudo dnf install hyprland hyprpaper nerd-fonts ags cava dunst kitty NetworkManager pamixer pavucontrol pipewire playerctl rofi swaylock swaylock-fancy waybar wireplumber wl-clipboard
	fi
	secure_copy "hypr"

	secure_install_fedora "cava"
	if [ to_install = "y" ] || [ to_install = "yes" ]; then
		sudo dnf install cava
	fi
	secure_copy "cava"

	secure_install_fedora "fastfetch"
	if [ to_install = "y" ] || [ to_install = "yes" ]; then
		sudo dnf install fastfetch
	fi
	secure_copy "fastfetch"

	secure_install_fedora "rofi"
	if [ to_install = "y" ] || [ to_install = "yes" ]; then
		sudo dnf install rofi
	fi
	secure_copy "rofi"

	secure_install_fedora "kitty"
	if [ to_install = "y" ] || [ to_install = "yes" ]; then
		sudo dnf install kitty
	fi
	secure_copy "kitty"

	secure_install_fedora "Thunar"
	if [ to_install = "y" ] || [ to_install = "yes" ]; then
		sudo dnf install Thunar
	fi
	secure_copy "Thunar"

	secure_install_fedora "waybar"
	if [ to_install = "y" ] || [ to_install = "yes" ]; then
		sudo dnf install waybar
	fi
	secure_copy "waybar"
fi

if [ "$1" = "nixos" ]  ||  [ "$1" = "--nixos" ] || [ "$1" = "-n" ]; then
	echo -e "${MAGENTA} Please add that to ur nixos configuration"
	echo -e "environment.systemPackages = with pkgs; [
	ags
	cava
	dunst
	fastfetch
	gtk3
	jq
	kdePackages.kio-extras
	kdePackages.kio-fuse
	kdePackages.qtsvg
	kdePackages.qtwayland
	kitty
	nerdfonts
	networkmanager
	pamixer
	pavucontrol
	pipewire
	playerctl
	rofi
	swaylock
	swaylock-fancy
	waybar
	wireplumber
	wl-clipboard
];"
fi
