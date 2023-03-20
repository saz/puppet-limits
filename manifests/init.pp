# == Class: limits
# @summary Manage user and group limits via Puppet
#
# This module manages the limits of the PAM module pam_limits.
#
# @example
#   include limits
#
# @param limits_file_owner
# The owner of the limits.conf file.
#
# @param limits_file_group
# The group of the limits.conf file.
#
# @param limits_file_mode
# The mode of the limits.conf file.
#
# @param limits_template
# The name of the template to use for ${limits_file
#
class limits (
  Hash    $entries,
  String  $limits_dir,
  Boolean $manage_limits_d_dir,
  Boolean $purge_limits_d_dir,
  String  $limits_file                = $limits::limits_file,
  Boolean $manage_limits_file         = false,
  String[1] $limits_file_owner        = $limits::limits_file_owner,
  String[1] $limits_file_group        = $limits::limits_file_group,
  String[1] $limits_file_mode         = $limits::limits_file_mode,
  Optional[String] $limits_template   = $limits::limits_template,
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

  if $manage_limits_file {
    file { $limits_file:
      ensure  => 'file',
      owner   => $limits_file_owner,
      group   => $limits_file_group,
      mode    => $limits_file_mode,
      content => template("limits/${limits_template}.erb"),
    }
  }

  $entries.each | String $e_name, Hash $e_params | {
    limits::limits { $e_name:
      * => $e_params,
    }
  }
}
