#!/bin/bash

# 必要なパッケージをインストール
sudo apt update
sudo apt install -y mpg321 git

# リポジトリをクローン
git clone https://github.com/hirotomoki12345/nyan.git

# /usr/local/bin ディレクトリを作成
sudo mkdir -p /usr/local/bin

# nyan ディレクトリに移動
cd nyan

# ファイルを /usr/local/bin にコピー
sudo cp nyan /usr/local/bin
sudo cp nyancat /usr/local/bin
sudo cp Nyanyanyanyanyanyanya.mp3 /usr/local/bin
sudo cp nyancat_set /usr/local/bin/
# 実行権限を付与
sudo chmod +x /usr/local/bin/nyan
sudo chmod +x /usr/local/bin/nyancat

# nyan ディレクトリを削除
cd ..
rm -rf nyan

echo "セットアップが完了しました。"
