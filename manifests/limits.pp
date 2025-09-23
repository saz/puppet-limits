# @summary Manage individual user/group limits
#
# This defined type creates individual limit configuration files in the limits.d directory.
# The title should be of the form user/limit_type if $user and $limit_type are not provided separately.
#
# @param ensure
#   Whether the limit configuration should be present or absent
#
# @param user
#   The user or group name to apply limits to. If not specified, extracted from title
#
# @param limit_type
#   The type of limit to set (e.g., 'nofile', 'nproc', 'core'). If not specified, extracted from title
#
# @param hard
#   The hard limit value
#
# @param soft
#   The soft limit value
#
# @param both
#   Set both hard and soft limits to the same value (uses '-' in limits file)
#
# @param target
#   Name of file in `limits::limits_dir` directory where settings will be applied.
#   If provided, title with `.conf` extension will not be used as target file.
#
# @example Setting file descriptor limits for all users
#   limits::limits{'*/nofile':
#     hard => 12345,
#     soft => 123,
#   }
#
# @example Setting limits using both parameter
#   limits::limits{'root/nofile':
#     both => 1234,
#   }
#
# @example Multiple settings in single file
#   limits::limits{'root/nofile':
#     both => 1234,
#     target => '01-root.conf',
#   }
#   limits::limits{'root/nproc':
#     both => 1234,
#     target => '01-root.conf',
#   }
define limits::limits (
  Enum['absent', 'present']          $ensure     = present,
  Optional[String[1]]                $user       = undef,
  Optional[String[1]]                $limit_type = undef,
  Optional[Variant[Integer, String]] $hard       = undef,
  Optional[Variant[Integer, String]] $soft       = undef,
  Optional[Variant[Integer, String]] $both       = undef,
  Optional[String[1]]                $target     = undef,
) {
  include limits

  # minimal validation
  if $ensure == 'present' {
    unless $hard or $soft or $both { fail('$hard, $soft or $both is required') }
  }
  unless $title =~ /\// {
    unless $user and $limit_type {
      fail('when not using the title pattern, $user and $limit_type are required')
    }
  }

  $key = split($title, '/')
  $real_user = $user ? {
    undef   => $key[0],
    default => $user,
  }
  $real_type = $limit_type ? {
    undef   => $key[1],
    default => $limit_type,
  }

  if $target {
    $target_file = "${limits::limits_dir}/${target}"
  } elsif $title =~ /\.conf$/ {
    $target_file = "${limits::limits_dir}/${title}"
  } else {
    if $real_user == '*' {
      $target_file    = "${limits::limits_dir}/default_${real_type}.conf"
    } else {
      $target_file    = "${limits::limits_dir}/${real_user}_${real_type}.conf"
    }
  }

  ensure_resource('concat::fragment', "top_${target_file}", {
      target  => $target_file,
      content => "# Managed by Puppet\n\n#<domain>    <type> <item>          <value>\n",
      order   => '01',
  })

  concat::fragment { "${real_user}_${real_type}":
    target  => $target_file,
    content => template('limits/limits.erb'),
  }

  ensure_resource('concat', $target_file, {
      ensure => $ensure,
      owner  => 'root',
      group  => 'root',
  })
}
