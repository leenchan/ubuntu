#!/bin/sh

cleanup_for_more_disk_space() {
	docker rmi `docker images -q`
	sudo rm -rf /usr/share/dotnet /etc/mysql /etc/php /etc/apt/sources.list.d /usr/local/lib/android
	sudo apt-mark hold grub-efi-amd64-signed
	sudo apt update
	sudo apt -y purge azure-cli* docker* ghc* zulu* llvm* firefox google* dotnet* powershell* openjdk* mysql* php* mongodb* dotnet* moby* snap*
	sudo apt -y full-upgrade
	sudo apt -y autoremove --purge
	sudo apt clean
}

cleanup_for_more_disk_space
