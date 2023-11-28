#Puppet
exec { 'ssh_authorized_key':
  cwd     => '/etc/ssh',
  creates => '/etc/ssh/ssh_config',
  path    => ['/root/.ssh/school.pub', '/root/.ssh/school'],
}
