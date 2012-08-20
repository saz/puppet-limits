class limits::config ($manage_limitsd) {
    file { $limits::params::limits_dir:
        ensure  => directory,
        owner   => root,
        group   => root,
        force   => true,
        purge   => $manage_limitsd,
        recurse => true,
    }
}
