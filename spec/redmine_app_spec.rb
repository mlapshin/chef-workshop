require 'spec_helper'

describe 'redmine::app' do
  run_chef_on :vm0 do |chef|
    chef.add_recipe 'redmine::pg'
  end

  run_chef_on :vm1 do |chef|
    chef.json = {
      redmine: {
        db_host: vm0.ip,
        db_passowrd: 's3cure'
      }
    }

    chef.add_recipe 'redmine::app'
  end

  it "should boostrap redmine installation (create database)" do
    vm0.execute_as("postgres", "psql -d redmine -c 'select 1+1'").should be_successful
  end

  it "should start webserver and display login page" do
    login_page = vm1.execute("wget -qO- http://localhost/login").stdout

    login_page.should include("Login")
    login_page.should include("Password")
  end
end
