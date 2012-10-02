# Class: limits
#
# This module manages limits
#
# Parameters:
#
# [*manage_limitsd*]
#   Should the limits module purge any non puppet managed files from
#   ${limits::params::limits_dir}
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class limits ($manage_limitsd = true) {

  include limits::params

  class {'limits::config':
    manage_limitsd => $manage_limitsd
  }
}
