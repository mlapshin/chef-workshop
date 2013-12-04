node.set['postgresql']['config']['port'] = 5455
node.set['postgresql']['password']['postgres'] = 's3cure'

include_recipe 'apt'
include_recipe 'postgresql::server'
