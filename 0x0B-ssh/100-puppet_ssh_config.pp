#Puppet
exec { 'ssh_authorized_key':
  command => '/usr/bin/ssh ubuntu@100.27.12.93',
  cwd     => '/etc/ssh',
  creates => '/etc/ssh/ssh_config',
  path    => ['/root/.ssh/school.pub', '/root/.ssh/school'],
}
