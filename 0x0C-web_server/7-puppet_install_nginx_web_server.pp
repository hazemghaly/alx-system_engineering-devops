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

nginx::resource::server { '${name}.${::default} ${name}':
    html        => true,
    ensure      => present,
    listen_port => 80,
    location    => '~ \.html$',
    index_files => ['index.html', 'index.htm'],
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
