#!/bin/bash

apt update -y
apt install -y apache2 openssl

systemctl enable apache2
systemctl start apache2

echo "<h1>Anna Leonova my hometask8</h1>" > /var/www/html/index.html

mkdir -p /etc/ssl/mycert

cat <<EOF > /etc/ssl/mycert/openssl.cnf
[ req ]
default_bits       = 2048
default_md         = sha256
prompt             = no
encrypt_key        = no
distinguished_name = req_distinguished_name
x509_extensions    = v3_req

[ req_distinguished_name ]
C  = UA
ST = Lviv
L  = Lviv
O  = DevOpsCourse
OU = Hometask8
CN = annadev.com

[ v3_req ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = localhost
IP.1  = 127.0.0.1
EOF

openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/ssl/mycert/self.key \
  -out /etc/ssl/mycert/self.crt \
  -config /etc/ssl/mycert/openssl.cnf

cat <<EOF > /etc/apache2/sites-available/ssl-site.conf
<VirtualHost *:443>
    ServerAdmin admin@example.com
    DocumentRoot /var/www/html

    SSLEngine on
    SSLCertificateFile /etc/ssl/mycert/self.crt
    SSLCertificateKeyFile /etc/ssl/mycert/self.key
</VirtualHost>
EOF

a2enmod ssl
a2ensite ssl-site.conf

systemctl restart apache2
