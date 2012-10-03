class limits::params {
  case $::osfamily {
    'Debian': {
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
