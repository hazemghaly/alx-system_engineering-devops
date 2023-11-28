#Puppet
#fdfd
exec { 'extract_important_tar':
  command => 'ssh user@0.0.0.0 "tar -xf /Volumes/nfs02/important.tar"',
  cwd     => '/etc/ssh',
  creates => '/etc/ssh/ssh_config',
  path    => ['/root/.ssh/school.pub', '/root/.ssh/school'],
  require => File['/path/to/.ssh/school'], 
}
