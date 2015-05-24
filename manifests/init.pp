class limits(
  $purge_limits_d_dir = true,
  $entries_hash = hiera_hash(limits::entries, {})
) inherits limits::params {
  file { $limits::params::limits_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    force   => true,
    purge   => $purge_limits_d_dir,
    recurse => true,
  }

  ### Create instances for integration with Hiera
  if $entries_hash != {} {
    validate_hash($entries_hash)
    create_resources(limits::limits, $entries_hash)
  }
}
