#Puppet
#fdfd
file { '/etc/ssh/ssh_config':
  ensure  => present,
}

file_line { 'no_pass':
  path  => ['/etc/ssh/ssh_config'],
  line  => ['PasswordAuthentication no']
  match => ['^#PasswordAuthentication']
}

file_line { 'Ident_file':
  path  => ['/etc/ssh/ssh_config'],
  line  => ['IdentityFile ~/.ssh/school']
  match => ['^#IdentityFile']
}
