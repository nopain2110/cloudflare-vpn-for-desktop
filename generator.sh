# -------------------
# Cloudflare VPN profile generator
# Scripted by Tuyen Tran
# http://fb.com/gr219
# -------------------
mkdir -p configs; cp register.py configs/; \
docker run --rm -i -v `pwd`/configs:/root -w /root ubuntu:devel sh -c '\
apt update; apt install -y wireguard python3-pip; \
pip3 install requests; python3 register.py'; \
echo "=====wgcf-profile.conf=====\n"; cat configs/wgcf-profile.conf; \
echo "=====wgcf-identity.json=====\n"; cat configs/wgcf-identity.json; \
echo "=============================\n"; \
docker run --rm -d -p 80:80 -v `pwd`/configs:/usr/local/apache2/htdocs/ httpd; \
rm configs/register.py;