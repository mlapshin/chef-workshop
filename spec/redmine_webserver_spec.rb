require 'spec_helper'

describe 'redmine::webserver recipe' do
  run_chef_on :vm0 do |chef|
    chef.json = {
      redmine: {
        db_host: "10.10.10.10",
        db_password: "some password"
      }
    }

    chef.add_recipe "redmine::install"
    chef.add_recipe "redmine::webserver"
  end

  it "should install nginx server" do
    vm0.should have_running_process("nginx")
  end

  it "should install unicorn" do
    vm0.should have_file("/home/redmine/redmine/config/unicorn.rb")
    vm0.should have_running_process("unicorn")

    vm0.should have_file("/home/redmine/redmine/tmp/sockets/unicorn.sock")
    vm0.should have_file("/home/redmine/redmine/tmp/pids/unicorn.pid")
  end
end
