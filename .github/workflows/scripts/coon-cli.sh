#!/bin/sh
CUR_DIR=$(cd "$(dirname "$0" 2>/dev/null)";pwd)

coon_cli_install() {
	# [ -z "$COON_CLI_URL" ] && return 1
	# sudo curl -skL -o /usr/bin/coon-cli "$COON_CLI_URL" && \
	# 	sudo chmod +x /usr/bin/coon-cli && \
	# 	echo "COON_CLI_BIN=/usr/bin/coon-cli" >> $GITHUB_ENV
	sudo tar -xf "$CUR_DIR/bin.tar.gz" -C /usr/bin && sudo chmod +x /usr/bin/coon-cli && echo "COON_CLI_BIN=/usr/bin/coon-cli" >> $GITHUB_ENV
}

coon_cli_install
