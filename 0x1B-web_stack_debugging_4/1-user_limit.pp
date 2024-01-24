#puppet
#$ulimit -a 
#pending signals                 (-i) 62760
#max locked memory       (kbytes, -l) 65536
#max memory size         (kbytes, -m) unlimited
#open files                      (-n) 1048576
#pipe size            (512 bytes, -p) 8
#POSIX message queues     (bytes, -q) 819200
#real-time priority              (-r) 0
#stack size              (kbytes, -s) 8192
exec { 'hard ':
    command => 'sed -i \'s/holberton hard nofile 15/holberton hard nofile 65536/g\' /etc/security/limits.conf',
    path    => ['/bin','/usr/bin']
}

exec { 'soft':
    command => 'sed -i \'s/holberton soft nofile 4/holberton soft nofile 65536/g\' /etc/security/limits.conf',
    path    => ['/bin', '/usr/bin'],
}
