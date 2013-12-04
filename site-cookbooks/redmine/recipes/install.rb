include_recipe 'apt'
package 'git'

user 'redmine' do
  shell '/bin/bash'
  home '/home/redmine'
  supports manage_home: true
end

directory '/home/redmine/redmine' do
  user 'redmine'
  group 'redmine'
end

git '/home/redmine/redmine' do
  user 'redmine'
  group 'redmine'
  repository 'https://github.com/redmine/redmine.git'
  reference '2.3-stable'
  depth 1
end

database_yml = {
  'production' => {
    'adapter'  => "postgresql",
    'pool'     => 5,
    'encoding' => 'unicode',
    'username' => 'postgres',
    'password' => node['redmine']['db_password'],
    'host'     => node['redmine']['db_host'],
    'database' => 'redmine',
    'port'     => 5455
  }
}

file '/home/redmine/redmine/config/database.yml' do
  user 'redmine'
  group 'redmine'
  content database_yml.to_yaml
end


file '/home/redmine/redmine/Gemfile.local' do
  user 'redmine'
  group 'redmine'

  content "gem 'unicorn'"
end

package 'ruby1.9.3'
gem_package 'bundler'

package "libmagickwand-dev"
package "libxslt-dev"
package "libxml2-dev"
package "libpq-dev"

execute 'install bundled gems' do
  cwd '/home/redmine/redmine'
  command 'bundle install --path vendor/bundle'
  user 'redmine'
end
