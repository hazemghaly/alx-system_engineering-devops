#puppet
exec { 'replace_limit':
    command => 'sed -i \'s/ULIMIT="-n 15"/ULIMIT="-n 4096"/g\' /etc/default/nginx',
    path    => ['/bin','/usr/bin']
}

exec { 'restart_nginx':
    command => 'sudo service nginx restart',
    path    => ['/bin', '/usr/bin'],
}
