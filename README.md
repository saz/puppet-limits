# puppet-limits

Manage user and group limits via Puppet

## Usage

```
    limits::limits { 'username_nofile':
        ensure => present,
        user => 'username',
        limit_type => 'nofile',
        hard => 16384,
        soft => 16384,
    }
```

You can set hard and soft only, but at least one of them
should be set.
