#!/bin/sh

action_ssh() {
	[ -z "$PASSWORD" ] && return 1
	sudo sh -c "echo '$PASSWORD:$PASSWORD' | tr ':' '\n' | passwd"
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
		ClientAliveCountMax 20' > /etc/ssh/sshd_config"
	sudo sh -c "systemctl restart sshd"
}

action_ssh
env
