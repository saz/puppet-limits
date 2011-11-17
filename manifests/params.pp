class limits::params {
    case $operatingsystem {
        /(Ubuntu|Debian)/: {
            $limits_dir = '/etc/security/limits.d/'
        }
    }
}
