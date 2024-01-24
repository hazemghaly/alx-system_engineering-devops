#puppet
exec { 'replace_limit_then_restart':
    command => 'sed -i \'s/15/4096/g\' /etc/default/nginx && sudo service nginx restart',
    path    => ['/bin','/usr/bin']
}
