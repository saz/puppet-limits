class limits(
  $purge_limits_d_dir = true
) inherits limits::params {
  file { $limits::params::limits_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    force   => true,
    purge   => $purge_limits_d_dir,
    recurse => true,
  }
}
