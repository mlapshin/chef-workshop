include_recipe 'apt'
package 'nginx'

service 'nginx' do
  action :start
end
