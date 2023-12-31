# PUPPET
# file of PUPPET
exec { 'update':
  command => '/usr/bin/apt-get update',
}

package { 'nginx':
  ensure => installed,
}

class { 'stdlib': }

augeas { 'nginx_config':
  context => '/files/etc/nginx/sites-enabled/default',
  changes => [
    'set listen[. = "80"]',
    'set server[. = "listen 80 default_server;"]/rewrite',
    'set server[. = "listen 80 default_server;"]/rewrite[1] ^/redirect_me https://github.com/hazemghaly permanent',
    'set server[. = "listen 80 default_server;"]/http[. = "add_header X-Served-By \"${hostname}\";"]',
  ],
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}

exec { 'nginx_restart':
  command => '/usr/sbin/service nginx restart',
  subscribe => Augeas['nginx_config'],
}
