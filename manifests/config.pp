class limits::config {
    file { $limits::params::limits_dir:
        ensure  => directory,
        owner   => root,
        group   => root,
        force   => true,
        purge   => true,
        recurse => true,
    }
}
