# 035 non

package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip',
  install_options => ['--no-cache-dir'],
}
