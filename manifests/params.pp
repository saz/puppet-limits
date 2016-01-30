class limits::params {
  case $::osfamily {
    'Debian','Gentoo','RedHat': {
      $limits_dir = '/etc/security/limits.d/'
    }
    default: {
      fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
    }
  }
}
