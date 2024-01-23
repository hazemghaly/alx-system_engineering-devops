#puppet
exec { 'replace_php':
    command => 'sed -i 's/ULIMIT="-n 15"/ULIMIT="-n 4096"/g' /etc/default/nginx',
    command => 'sudo service nginx restart',
    path    => ['/bin','/usr/bin']
}
