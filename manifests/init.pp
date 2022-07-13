# == Class: limits
#
class limits (
  Hash    $entries,
  String  $limits_dir,
  Boolean $manage_limits_d_dir,
  Boolean $purge_limits_d_dir,
) {

  if $manage_limits_d_dir {
    file { $limits_dir:
      ensure  => 'directory',
      owner   => 'root',
      group   => 'root',
      force   => true,
      purge   => $purge_limits_d_dir,
      recurse => true,
    }
  }

  ### Create instances for integration with Hiera

  $entries.each | String $e_name, Hash $e_params | {
    limits::limits { $e_name:
      * => $e_params,
    }
  }

}
