<<<<<<< HEAD
#PUPET
#file of PUPET
exec {'update':
  command => '/usr/bin/apt-get update',
}

package { 'nginx':
  ensure => installed,
}

file_line { 'install':
  ensure => 'present',
  path   => '/etc/nginx/sites-enabled/default',
  after  => 'listen 80 default_server;',
  line   => [
    'rewrite ^/redirect_me https://github.com/hazemghaly permanent;',
    'http {\n\tadd_header X-Served-By "${hostname}";',
  ],
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

exec {'r':
  command => '/usr/sbin/service nginx start',
}
=======
#PUPET
#file of PUPET
exec {'update':
  command => '/usr/bin/apt-get update',
}

package { 'nginx':
  ensure => installed,
}

file_line { 'install':
  ensure => 'present',
  path   => '/etc/nginx/sites-enabled/default',
  after  => 'listen 80 default_server;',
  line   => [
    'rewrite ^/redirect_me https://github.com/hazemghaly permanent;',
    'http {\n\tadd_header X-Served-By "${hostname}";',
  ],
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

exec {'r':
  command => '/usr/sbin/service nginx start',
}
>>>>>>> 8c9ca3e5bf9d5c8fec6e6ed969ca3f19dea39353
