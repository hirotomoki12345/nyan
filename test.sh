#!/bin/sh -e

# スクリプトのパス
SCRIPT_PATH="/usr/local/bin/nyancat.sh"

# 仮想端末番号
TTY_NUMBER=4

# 仮想端末に切り替え
/usr/bin/chvt $TTY_NUMBER

# スクリプトを実行
echo "Starting script on TTY $TTY_NUMBER..."
# /dev/tty4 にコマンドを送信するために、screen または tmux を使用
su -c "script -c '$SCRIPT_PATH' /dev/tty$TTY_NUMBER" $USER

exit 0
