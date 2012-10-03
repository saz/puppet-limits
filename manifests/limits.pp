define limits::limits(
  $user,
  $limit_type,
  $ensure = present,
  $hard = undef,
  $soft = undef
) {
  file { "${limits::params::limits_dir}${name}":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    content => template('limits/limits.erb'),
  }
}
