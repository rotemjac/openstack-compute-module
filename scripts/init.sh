#!/bin/bash

yum install -y httpd
chkconfig --level 345 httpd on

cat <<EOF > /var/www/html/index.html
<html>
<body>
<p>hostname is: $(hostname)</p>
</body>
</html>
EOF
chown -R apache:apache /var/www/html
service httpd start