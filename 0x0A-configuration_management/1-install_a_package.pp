# non
python::pip { 'Flask':
  ensure     => '2.1.0',
  pkgname    => 'Flask',
  python     => 'python3',
  require    => Class['python'],
}
