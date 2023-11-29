#Puppet
#fdfd
file { '/etc/ssh/ssh_config':
  ensure  => present,
}

file_line { 'no_pass':
  path  => ['/etc/ssh/ssh_config'],
  line  => ['PasswordAuthentication no', 'IdentityFile ~/.ssh/school']
  match => ['^#PasswordAuthentication', '^#IdentityFile']
}
