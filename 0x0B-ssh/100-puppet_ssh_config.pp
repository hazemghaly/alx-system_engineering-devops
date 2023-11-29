#Puppet
#fdfd
exec { 'ssh ubuntu@100.27.12.93':
  cwd     => '/var/tmp',
  creates => '/var/tmp/myfile',
  path    => ['/etc/ssh/ssh_config'],
}
