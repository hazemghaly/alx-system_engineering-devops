#PUPET
#file of PUPET
class nginx_server {
  package { 'nginx':
    ensure => installed,
  }

  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
  }

  nginx::resource::server { 'example.com':
    ensure      => present,
    listen_port => 80,
    location    => {
      '/' => {
        try_files => '$uri $uri/ =301',
      },
      '/redirect_me' => {
        rewrite => '^/redirect_me$ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent',
      },
    },
  }
}
