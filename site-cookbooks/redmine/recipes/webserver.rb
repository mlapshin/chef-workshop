include_recipe "simple_nginx"

template '/etc/nginx/sites-available/redmine.conf' do
  source 'redmine.conf.erb'
end

link '/etc/nginx/sites-enabled/redmine.conf' do
  to '/etc/nginx/sites-available/redmine.conf'

  notifies :restart, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/default' do
  action :delete

  notifies :restart, 'service[nginx]'
end

template '/home/redmine/redmine/config/unicorn.rb' do
  user 'redmine'
  group 'redmine'
  source 'unicorn.rb.erb'
end

unicorn_command = <<-BASH
sudo -iu redmine bash -c 'cd /home/redmine/redmine &&
bundle exec unicorn_rails -E production
-c /home/redmine/redmine/config/unicorn.rb'
BASH

service "unicorn_redmine" do
  provider Chef::Provider::Service::Upstart
end

template "/etc/init/unicorn_redmine.conf" do
  source "upstart.conf.erb"
  variables('command' => unicorn_command.gsub("\n", ' '))
  notifies :restart, "service[unicorn_redmine]"
end
