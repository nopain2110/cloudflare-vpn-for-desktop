#!/bin/bash
# -------------------
# Cloudflare VPN data booster
# Scripted by Tuyen Tran
# http://fb.com/gr219
# -------------------
referal=$1
interval=$2

docker run -v `pwd`/getdata.sh:/getdata.sh --rm -i alpine sh -c \
"apk add pwgen curl; \
chmod 777 /boost.sh; \
sh /boost.sh $referal $interval"