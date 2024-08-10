#!/bin/bash

# 追加したいスクリプトやコマンドを変数にセット
custom_command="/usr/local/bin/nyancat_set"

# /etc/rc.localにスクリプトを追加（exit 0の前）
sudo sed -i -e "/^exit 0/i $custom_command" /etc/rc.local

echo "コマンドが /etc/rc.local にセットされました。"


# 起動しているデバイスを取得
boot_device=$(lsblk -o NAME,MOUNTPOINT | grep ' /$' | awk '{print $1}')
boot_device="/dev/${boot_device}"

# USBから起動しているか確認
if [[ $(lsblk -o NAME,TRAN | grep "$boot_device" | grep -q 'usb') ]]; then
  echo "USBから起動しています。"

  # 内部ディスクを特定（USB以外のディスク）
  internal_disk=$(lsblk -o NAME,TRAN | grep -v 'usb' | awk '{print $1}' | head -n 1)
  internal_disk="/dev/${internal_disk}"

  # 内部ディスクに今のOSを焼く
  echo "内部ディスク(${internal_disk})にOSを焼きます..."
  dd if="$boot_device" of="$internal_disk" bs=4M status=progress

  echo "完了しました。"
else
  echo "USBから起動していません。"
fi
sudo reboot
