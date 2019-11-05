#! /bin/bash
apt-get update
apt-get install -y apache2
cat <<EOF > /var/www/html/index.html
<html><body><h1>Hello World</h1>
<p>This page was created by Terraform with startup script!</p>
<h2>Project ID: ${project_id}</h2>
<h3>Region: ${region}</h3>
<h3>Subnet: ${subnet}</h3>
</body></html>
EOF
