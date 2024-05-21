curl -o nyan https://raw.githubusercontent.com/hirotomoki12345/repository/main/nyan
curl -o nyancat https://raw.githubusercontent.com/hirotomoki12345/repository/main/nyancat
mkdir -p mpg123_transfer
curl -o mpg123_transfer/ld-linux-aarch64.so.1 https://raw.githubusercontent.com/hirotomoki12345/nyan/main/mpg123_transfer/ld-linux-aarch64.so.1
curl -o mpg123_transfer/libc.so.6 https://raw.githubusercontent.com/hirotomoki12345/nyan/main/mpg123_transfer/libc.so.6
curl -o mpg123_transfer/libm.so.6 https://raw.githubusercontent.com/hirotomoki12345/nyan/main/mpg123_transfer/libm.so.6
curl -o mpg123_transfer/libmpg123.so.0 https://raw.githubusercontent.com/hirotomoki12345/nyan/main/mpg123_transfer/libmpg123.so.0
curl -o mpg123_transfer/libout123.so.0 https://raw.githubusercontent.com/hirotomoki12345/nyan/main/mpg123_transfer/libout123.so.0
curl -o mpg123_transfer/libsyn123.so.0 https://raw.githubusercontent.com/hirotomoki12345/nyan/main/mpg123_transfer/libsyn123.so.0
curl -o mpg123_transfer/mpg123 https://raw.githubusercontent.com/hirotomoki12345/nyan/main/mpg123_transfer/mpg123

sudo cp ~/mpg123_transfer/mpg123 /usr/local/bin/
sudo cp ~/mpg123_transfer/libmpg123.so.0 /usr/local/lib/
sudo cp ~/mpg123_transfer/libout123.so.0 /usr/local/lib/
sudo cp ~/mpg123_transfer/libsyn123.so.0 /usr/local/lib/
sudo cp ~/mpg123_transfer/libm.so.6 /usr/local/lib/
sudo cp ~/mpg123_transfer/libc.so.6 /usr/local/lib/
sudo cp ~/mpg123_transfer/ld-linux-aarch64.so.1 /usr/local/lib/
