Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "develop"
  config.vm.network "private_network", type: "dhcp"
  config.ssh.forward_agent = true
  config.vm.synced_folder ".", "/vagrant"
  config.vm.provision "shell", path: "vagrant/initial.sh"
  config.vm.provision "shell", path: "vagrant/apt.sh"
  config.vm.provision "shell", path: "vagrant/nginx.sh"
  config.vm.provision "shell", path: "vagrant/php.sh"
  config.vm.provision "shell", path: "vagrant/pgsql.sh"
  config.vm.provision "shell", path: "vagrant/redis.sh"
  config.vm.provision "shell", path: "vagrant/mongo.sh"
  config.vm.provision "shell", path: "vagrant/nodejs.sh"
  config.vm.provision "shell", path: "vagrant/solr.sh"
end
