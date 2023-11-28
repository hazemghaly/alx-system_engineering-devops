#Puppet
class ubuntu {
    $public_key_content = file('/root/.ssh/school')
   ssh_authorized_key { 'ubuntu@100.27.12.93':
     ensure => present,
     user   => 'ubuntu',
     type   => 'ssh-rsa',
     key    => $public_key_content,
   }
}
