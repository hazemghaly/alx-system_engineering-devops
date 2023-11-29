#Puppet
#fdfd
file { '/etc/ssh/ssh_config':
  ensure  => present,
}

exec { 'ssh_command':
  command => '/usr/bin/ssh',
  user    => 'ubuntu',
  cwd     => '/var/tmp',
  creates => '/var/tmp/myfile',
  path    => ['/etc/ssh/ssh_config'],
  require => File['/etc/ssh/ssh_config'],
}
