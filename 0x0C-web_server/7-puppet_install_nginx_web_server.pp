#PUPET
#file of PUPET
define web::nginx_redirect (
  html                  = true,
  $www_root             = "${full_web_path}/${name}/",
)
nginx::resource::server { "${name}.${::nginx} ${name}":
    ensure                => present,
    listen_port           => 80,
    location              => '~ \.html$',
    index_files           => ['index.html', 'index.htm'],
}
