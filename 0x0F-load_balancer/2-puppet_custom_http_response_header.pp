# PUPPET
# file of PUPPET
class { 'nginx':
  manage_repo => true,
}

nginx::resource::server { 'example.com':
  listen_port => '80',
  server_name => 'example.com',
  location    => {
    '/' => {
      'proxy_pass' => 'http://backend',
      'proxy_set_header' => 'X-Served-By $hostname',
    },
  },
}
