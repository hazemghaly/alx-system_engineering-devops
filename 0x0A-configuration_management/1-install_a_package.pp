exec { 'install python packages':
    command   => 'sudo pip3 install flask',
    path => ['/usr/bin/'],
}
