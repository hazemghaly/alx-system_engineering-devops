# installing flasl 035
python::pip { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  python   => 'python3',
}
