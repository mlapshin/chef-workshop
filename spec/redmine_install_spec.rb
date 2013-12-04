require 'spec_helper'

describe 'redmine::install recipe' do
  run_chef_on :vm0 do |chef|
    chef.json = {
      redmine: {
        db_host: "10.10.10.10",
        db_password: "some password"
      }
    }
    chef.add_recipe "redmine::install"
  end

  it "should create user and home dir for redmine installation" do
    vm0.should have_user("redmine").in_group("redmine")

    vm0.should have_directory("/home/redmine/redmine")
      .with_owner("redmine")
  end

  it "should create database.yml file" do
    vm0.should have_file("/home/redmine/redmine/config/database.yml")
  end

  it "should install bundled gems" do
    result = vm0.execute_as "redmine", "cd /home/redmine/redmine && bundle show"
    result.should be_successful

    result.stdout.should include("rails")
    result.stdout.should include("rmagick")
    result.stdout.should include("pg")
    result.stdout.should include("unicorn")
  end
end
