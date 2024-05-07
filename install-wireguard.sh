
sudo apt install wireguard

# wireguard conf 파일 복사
sudo cp my.conf /etc/wireguard/wg0.conf

# wg-quick up wg0 시에 resolvconf 를 못찾는 오류 해결
sudo ln -s /usr/bin/resolvectl /usr/local/bin/resolvconf

# 연결
sudo wg-quick up wg0

# 상태 확인
sudo wg show
