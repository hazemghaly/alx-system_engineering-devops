#Puppet
file { '/home/ubuntu/.ssh/config':
  ensure  => present,
  content => @("SSH_CONFIG"
    Host your_target_host
      IdentityFile ~/.ssh/school
      PasswordAuthentication no
 SSH_CONFIG),
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode    => '0600',
}
