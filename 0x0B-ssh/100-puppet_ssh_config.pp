#Puppet
#fdfd
file { '/etc/ssh/ssh_config':
  ensure  => present,
  content => "# /etc/ssh/ssh_config\n\nHost *\n  ForwardAgent yes\n  Port 22\n  # Add other configuration options as needed\n",
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}

exec { 'extract_important_tar':
  command => 'ssh ubuntu@100.27.12.93 "tar -xf /Volumes/nfs02/important.tar"',
  cwd     => '/etc/ssh',
  creates => '/etc/ssh/ssh_config',
  path    => ['/root/.ssh/school.pub', '/root/.ssh/school'],
  require => [
    File['/etc/ssh/ssh_config'],
    File['/path/to/.ssh/school'],
  ],
}
