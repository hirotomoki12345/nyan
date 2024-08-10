chvt 3
exec script -c "clear; nyancat" /dev/tty3





#!/bin/bash

# ユーザー名を入力してもらう
read -p "自動ログインに使用するユーザー名を入力してください: " username

# 1. getty@tty3.service.d/override.conf の作成と設定
sudo mkdir -p /etc/systemd/system/getty@tty3.service.d/
sudo bash -c "cat << EOF > /etc/systemd/system/getty@tty3.service.d/override.conf
[Service]
ExecStart=
ExecStart=-/sbin/agetty --noclear --autologin $username %I \$TERM
Type=simple
EOF"

# 2. .bash_profile または .bashrc に tty3 用の自動実行スクリプトを追加
profile_file="/home/$username/.bash_profile"
if ! grep -q 'tty3' "$profile_file"; then
    sudo bash -c "echo 'if [[ \$(tty) == \"/dev/tty3\" ]]; then' >> $profile_file"
    sudo bash -c "echo '    /usr/local/bin/nyancat' >> $profile_file"
    sudo bash -c "echo '    exit 0' >> $profile_file"
    sudo bash -c "echo 'fi' >> $profile_file"
fi

# 3. systemd のデーモンをリロードして設定を反映
sudo systemctl daemon-reload

# 4. システムの再起動を促すメッセージ
echo "設定が完了しました。システムを再起動してください。"
