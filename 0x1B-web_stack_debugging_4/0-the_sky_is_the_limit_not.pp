#puppet
#exec { 'replace_limit':
#    command => 'sed -i \'s/15/4096/g\' /etc/default/nginx && sudo service nginx restart',
#    path    => ['/bin','/usr/bin']
#}
exec { 'replace_limit':
    command => 'sed -i \'s/15/4096/g\' /etc/default/nginx',
    path    => ['/bin','/usr/bin']
}

exec { '_restart':
    command => 'sudo service nginx restart',
    path    => ['/bin','/usr/bin'],
    require => Exec['replace_limit']
}
