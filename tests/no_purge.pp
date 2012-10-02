# setup security limits (soft/hard nofiles)
class {'limits':
  manage_limitsd => false,
}

limits::limits { 'puppet_noproc':
  ensure     => present,
  user       => 'puppet',
  limit_type => 'nproc',
  soft       => 'true',
  hard       => 'true',
}

limits::limits { 'star_nofile':
  ensure     => present,
  user       => '*',
  limit_type => 'nofile',
  soft       => 'true',
  hard       => 'true',
}
