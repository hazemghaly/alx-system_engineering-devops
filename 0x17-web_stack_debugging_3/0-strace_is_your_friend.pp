#puppet
exec { 'replace_php':
    command  => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
    path     => ['/bin','/usr/bin']
}
