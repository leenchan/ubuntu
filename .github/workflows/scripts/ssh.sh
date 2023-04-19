#!/bin/sh

ssh_restart() {
	[ -z "$ROOT_PASSWORD" ] && return 1
	sudo sh -c "echo '${ROOT_PASSWORD}::::${ROOT_PASSWORD}' | awk -F'::::' '{print $1"\n"$2"\n"}' | passwd root"
	sudo sh -c "sed \
		-e '/^[Pp]ort[^s]/d' \
		-e '/PasswordAuthentication/d' \
		-e '/PermitRootLogin/d' \
		-e '/UsePAM/d' \
		-e '/TCPKeepAlive/d' \
		-e '/ClientAliveInterval/d' \
		-e '/ClientAliveCountMax/d' \
		-i /etc/ssh/sshd_config"
	sudo sh -c "echo '
		Port 22
		PasswordAuthentication yes
		PermitRootLogin yes
		UsePAM yes
		TCPKeepAlive yes
		ClientAliveInterval 360
		ClientAliveCountMax 20' >> /etc/ssh/sshd_config"
	sudo sh -c "systemctl restart sshd"
}

ssh_restart
