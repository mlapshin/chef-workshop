include_recipe 'redmine::install'
include_recipe 'redmine::webserver'

execute "redmine installation rakes" do
  command "bundle exec rake generate_secret_token db:create db:migrate redmine:load_default_data REDMINE_LANG=en"
  cwd "/home/redmine/redmine"
  user 'redmine'
  group 'redmine'
  environment({ 'HOME' => '/home/redmine', 'RAILS_ENV' => 'production' })
end
