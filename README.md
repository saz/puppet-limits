# puppet-limits [![Build Status](https://secure.travis-ci.org/saz/puppet-limits.png)](http://travis-ci.org/saz/puppet-limits)

Manage user and group limits via Puppet

This module manages the limits of the PAM module pam_limits.

## How to use

### Purge limits.d directory

```ruby
    limits::limits { 'username_nofile':
      ensure     => present,
      user       => 'username',
      limit_type => 'nofile',
      hard       => 16384,
      soft       => 16384,
    }
```
### Do NOT purge limits.d directory

```ruby
    class { 'limits':
      purge_limits_d_dir => false,
    }

    limits::limits { 'username_nofile':
      ensure     => present,
      user       => 'username',
      limit_type => 'nofile',
      hard       => 16384,
    }
```

### Set both limit types in one line

```ruby
    limits::limits { 'username_nofile':
      ensure     => present,
      user       => 'username',
      limit_type => 'nofile',
      both       => 16384,
    }

One of hard, soft or both must be set!
