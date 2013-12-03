def define_vm(config, name, ip)
  config.vm.define name.to_sym do |config|
    config.vm.hostname = name.to_s.gsub('_','-')
    config.vm.box = "ubuntu1204"
    config.vm.box_url = "http://s3.amazonaws.com/hs-vagrant-boxes/ubuntu1204.box"
    config.vm.network :private_network, ip: ip

    config.vm.provider :virtualbox do |vb|
      # http://askubuntu.com/questions/238040/how-do-i-fix-name-service-for-vagrant-client
      # May be fixed with a better configured box
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

      # we don't need too much memory for our tests
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end

    # chef-solo provider must be specified
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = %w[site-cookbooks cookbooks]
    end
  end
end

Vagrant.configure("2") do |config|
  define_vm(config, :vm0, "192.168.33.10")
  define_vm(config, :vm1, "192.168.34.10")
end
