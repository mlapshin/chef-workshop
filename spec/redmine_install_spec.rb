require 'spec_helper'

describe 'redmine::install recipe' do
  run_chef_on :vm0 do |chef|
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
end
