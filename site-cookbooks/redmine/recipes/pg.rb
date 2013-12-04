node.set['postgresql']['config']['port'] = 5455
node.set['postgresql']['config']['listen_addresses'] = '0.0.0.0'
node.set['postgresql']['password']['postgres'] = 's3cure'

node.set['postgresql']['pg_hba'] = [
  {
    comment: "# allow all incoming connections",
    type: "host",
    db: 'all',
    user: 'all',
    addr: '0.0.0.0/0',
    method: 'md5'
  }
]

include_recipe 'apt'
include_recipe 'postgresql::server'
