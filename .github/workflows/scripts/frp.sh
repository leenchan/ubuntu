#!/bin/sh

frp_client() {
	[ -x "$COON_CLI_BIN" ] || return 1
	[ -z "$FRP_SERVER" -o -z "$FRP_PORTS" ] && return 1
	echo "$FRP_PORTS"
	echo "::add-mask::$(echo $FRP_SERVER | awk -F':' '{print $1}' | grep -Eo '[^.]+\.[^.]+$')"
	sudo $COON_CLI_BIN frp install
	while read PORT
	do
		[ -z "$PORT" ] || {
			eval $(echo "$PORT" | awk -F':' '{print "FRP_PORT_LOCAL=\""$1"\"; FRP_PORT_REMOTE=\""$2"\""}')
			sudo $COON_CLI_BIN frp client -s $FRP_SERVER -l "127.0.0.1:${FRP_PORT_LOCAL}" -p "${FRP_PORT_REMOTE}" -T $FRP_TOKEN
		}
	done <<-EOF
	$(echo "$FRP_PORTS" | grep -Eo '[1-9][0-9]+:[1-9][-0-9+]+')
	EOF
}

frp_client
