#Puppet
file { '/home/ubuntu/.ssh/config':
  ensure  => present,
  content => @("SSH_CONFIG"
    100.27.12.93
      IdentityFile ~/.ssh/school
      PasswordAuthentication no
  SSH_CONFIG),
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode    => '0600',
}
