class limits::params {
  case $::osfamily {
    'Debian','RedHat': {
      $limits_dir = '/etc/security/limits.d/'
    }
    default: {
      case $::operatingsystem {
        default: {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }
}
