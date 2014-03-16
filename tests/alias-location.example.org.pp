$domain_name = "alias-location.example.org"
$server_config_file_name = "/tmp/pp-nginx-results/$domain_name.conf"

nginx::server { $domain_name:
  ensure => present,
  server_config_file_name => $server_config_file_name,
  content => "
    listen                *:80;

    server_name           $domain_name;
  "
}

nginx::server::location::alias { "with-content":
  location => "~ /assets/(.*)",
  server => $domain_name,
  location_alias => '/var/www/$domain_name/assets/$1',
  content => "
        index index.html;
  "
}

nginx::server::location::alias { "without-content":
  location => "~ /other-assets/(.*)",
  server => $domain_name,
  location_alias => '/var/www/$domain_name/assets/$1',
}