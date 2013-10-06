define limits::limits(
  $user,
  $limit_type,
  $ensure = present,
  $hard = undef,
  $soft = undef,
  $both = undef
) {
  include limits::params

  if $name =~ /.conf$/ {
    $target_file = "${limits::params::limits_dir}${name}"
  } else {
    $target_file = "${limits::params::limits_dir}${name}.conf"
  }

  file { $target_file:
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    content => template('limits/limits.erb'),
  }
}
