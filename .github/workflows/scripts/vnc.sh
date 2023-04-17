#!/bin/sh

vnc_install() {
	[ -x "$COON_CLI_BIN" ] || return 1
	[ -z "$VNC_PASSWORD" ] && return 1
	sudo VNC_PWD="$VNC_PASSWORD" DESKTOP_ENV="xfce" $COON_CLI_BIN install aria2 vnc desktop
}

vnc_install
