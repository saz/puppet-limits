define limits::limits ($ensure = present, $user = undef, $limit_type = undef, $hard = undef, $soft = undef) {

    require limits

    file { "${limits::params::limits_dir}${name}":
        ensure  => $ensure,
        owner   => root,
        group   => root,
        content => template('limits/limits.erb'),
    }
}
