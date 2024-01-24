#puppet
exec { 'replace_limit':
    command => 'sed -i 's/15/4096/g' /etc/default/nginx',
    path    => ['/bin','/usr/bin']
}

exec { 'restart_nginx':
    command => 'sudo service nginx restart',
    path    => ['/bin', '/usr/bin'],
}
