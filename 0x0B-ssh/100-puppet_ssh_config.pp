#Puppet
class ubuntu {
   ssh_authorized_key { 'ubuntu@100.27.12.93':
     ensure => present,
     user   => 'ubuntu',
     type   => 'ssh-rsa',
     key    => /root/.ssh/school,
   }
}
