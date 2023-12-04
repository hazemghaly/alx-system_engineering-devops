# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure Nginx site
nginx::resource::vhost { 'default':
  ensure  => present,
  content => '
    listen      80 default_server;
    server_name _;

    location / {
      add_header X-Served-By $hostname; # Add this line for X-Served-By header
      root /var/www/html;
      index index.html;
    }

    location /redirect_me {
      rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
    }

    error_page 404 /404.html;
    location = /404.html {
      internal;
      root /var/www/html;
    }
  ',
}

# Create index.html
file { '/var/www/html/index.html':
  content => 'Hello World!',
}

# Ensure Nginx service is running
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
