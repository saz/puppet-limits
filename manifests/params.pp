class limits::params {
    case $operatingsystem {
        /(Ubuntu|Debian|CentOS)/: {
            $limits_dir = '/etc/security/limits.d/'
        }
    }
}
