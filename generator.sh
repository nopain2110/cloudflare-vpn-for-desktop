# -------------------
# Cloudflare VPN profile generator
# Scripted by Tuyen Tran
# http://fb.com/gr219
# -------------------
mkdir -p configs; \
docker run --rm -i -v `pwd`/configs:/root -w /root ubuntu:devel sh -c '\
apt update; apt install -y wireguard python3-pip; \
wg genkey > privatekey; wg pubkey < privatekey > publickey; \
pip3 install requests; python3 register.py'; \
rm -rf .*; \
docker run --rm -d -p 80:80 -v `pwd`/configs:/usr/local/apache2/htdocs/ httpd