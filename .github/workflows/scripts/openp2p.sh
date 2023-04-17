#!/bin/sh

openp2p_client() {
	[ -z "$OPENP2P_TOKEN" ] && return 1
	sudo curl -k -o install.sh "https://openp2p.cn/download/v1/latest/install.sh" && sudo bash ./install.sh --token $OPENP2P_TOKEN
}

openp2p_client
