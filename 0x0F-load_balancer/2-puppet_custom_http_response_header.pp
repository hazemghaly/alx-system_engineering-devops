#PUPET
#file of PUPET
export RUBYOPT='-W0'
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
  line   => 'rewrite ^/redirect_me https://github.com/hazemghaly permanent;',
  line  => "http {\n\tadd_header X-Served-By \"${hostname}\";",
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
