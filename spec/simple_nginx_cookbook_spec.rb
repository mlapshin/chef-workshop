require 'spec_helper'

describe 'simple_nginx cookbook' do
  run_chef_on :vm0 do |chef|
    chef.add_recipe 'simple_nginx::default'
  end

  it "should install nginx server" do
    vm0.should have_running_process("nginx")
    vm0.should have_user("www-data").in_group("www-data")

    vm0.execute("wget -qO- http://localhost/").stdout.should include("Welcome to nginx!")
  end
end
