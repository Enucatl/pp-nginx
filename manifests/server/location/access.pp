define nginx::server::location::access (
  $allow = [],
  $deny = [],
  $content = undef,
  $config_template = "nginx/conf.d/location/access.conf.erb",

  $server = undef,
  $location	= undef,
  $ensure = present,
  $order = "050",
) {
  validate_array($allow)
  validate_array($deny)

  nginx::server::location::fragment { "access_${name}":
    content => template($config_template),

    server => $server,
    location => $location,
    ensure => $ensure,
    order => $order,
  }
}
