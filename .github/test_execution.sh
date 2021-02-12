#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install -y openssl socat ca-certificates

echo "" | \
    openssl s_client \
        -connect github.com:443 \
        -showcerts 2>/dev/null | \
            sed -n -e "/-----BEGIN CERTIFICATE/,/-----END CERTIFICATE/p" > github.com.pem

./hapos-upd --cert github.com.pem -d --VAfile - > output

grep "Response verify OK" output
