#!/bin/sh

coon_cli_install() {
	[ -z "$COON_CLI_URL" ] && return 1
	sudo curl -skL -o /usr/bin/coon-cli "$COON_CLI_URL" && \
		sudo chmod +x /usr/bin/coon-cli && \
		echo "COON_CLI_BIN=/usr/bin/coon-cli" >> $GITHUB_ENV
}

coon_cli_install
