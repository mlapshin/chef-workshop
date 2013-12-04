require 'spec_helper'

describe "redmine::pg recipe" do
  run_chef_on :vm0 do |chef|
    chef.add_recipe "redmine::pg"
  end

  it "should install postgresql server" do
    vm0.should listen_port(5455)
    vm0.should have_user("postgres").in_group("postgres")

    vm0.execute_as("postgres", "psql -A -t -d postgres -c 'select 1+1'").stdout.should == "2"
  end
end
