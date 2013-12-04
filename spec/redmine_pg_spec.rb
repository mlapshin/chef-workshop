require 'spec_helper'

describe "redmine::pg recipe" do
  run_chef_on :vm0 do |chef|
    chef.add_recipe "redmine::pg"
  end

  run_chef_on :vm1 do |chef|
    chef.add_recipe "postgresql::client"
  end

  let(:server) { vm0 }
  let(:client) { vm1 }

  it "should install postgresql server" do
    server.should listen_port(5455)
    server.should have_user("postgres").in_group("postgres")

    server.execute_as("postgres", "psql -A -t -d postgres -c 'select 1+1'").stdout.should == "2"
  end

  it "should allow incoming connections" do
    client.execute("PGPASSWORD=s3cure psql -A -t -d postgres -U postgres -p 5455 -h #{server.ip} -c 'select 1+1'").stdout.should == '2'
  end
end
