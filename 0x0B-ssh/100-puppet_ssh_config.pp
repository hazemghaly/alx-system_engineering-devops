#Puppet
<<<<<<< HEAD
class ubuntu {
    $public_key_content = file('/root/.ssh/school')
   ssh_authorized_key { 'ubuntu@100.27.12.93':
     ensure => present,
     user   => 'ubuntu',
     type   => 'ssh-rsa',
     key    => $public_key_content,
   }
=======
exec { 'ssh_authorized_key':
  cwd     => '/etc/ssh',
  creates => '/etc/ssh/ssh_config',
  path    => ['/root/.ssh/school.pub', '/root/.ssh/school'],
>>>>>>> 76d96b707543e05caff68ac83f046ca4b6f56584
}
