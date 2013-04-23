require 'chef'
Chef::Config.from_file(File.join(File.dirname(__FILE__), '.chef', 'knife.rb'))

Vagrant.configure("2") do |config|
  config.vm.box = "opscode-ubuntu-12.04"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.2.0.box"
  config.vm.forward_port 80, 8080
  config.vm.share_folder "shared", "/shared", "shared"

  config.vm.provision :chef_client do |chef|
    chef.chef_server_url = Chef::Config[:chef_server_url]
    chef.log_level = Chef::Config[:log_level]
    chef.validation_key_path = Chef::Config[:validation_key]
    chef.validation_client_name = Chef::Config[:validation_client_name]
    chef.node_name = "#{Chef::Config[:node_name]}-vagrant"

    chef.run_list = [
    ]
  end
end
