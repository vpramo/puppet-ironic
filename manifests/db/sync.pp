#
# Class ironic::db::sync
#
class ironic::db::sync {
  exec {'ironic_db_sync':
    command   => 'ironic-dbsync',
    user      => 'ironic',
    onlyif    => 'ironic-dbsync version | grep None',
    path      => '/usr/bin:/bin:/usr/local/bin',
    subscribe => [Package['ironic'], Ironic_config['database/connection']],
    require   => User['ironic']
  }
}
