Vagrant.configure("2") do |config|
  config.vm.box = "opscode-ubuntu-12.04"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.2.0.box"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.synced_folder "shared", "/shared"

  config.vm.provision :chef_client do |chef|
    chef.chef_server_url = ENV['KNIFE_CHEF_SERVER']
    chef.validation_key_path = "#{ENV['KNIFE_VALIDATION_KEY_FOLDER']}/#{ENV['OPSCODE_ORGNAME']}-validator.pem"
    chef.validation_client_name = "#{ENV['OPSCODE_ORGNAME']}-validator"
    chef.node_name = "#{ENV['OPSCODE_USER']}-vagrant"
    chef.run_list = [
      'motd',
      'minitest-handler'
    ]
  end
end
