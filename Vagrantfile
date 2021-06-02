Vagrant.configure("2") do |config|
  config.vm.box = "aakulov/bionic64"
  config.vm.hostname = "ptfe"
  config.vm.network "private_network", ip: "192.168.56.33"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024 * 4
    v.cpus = 2
  end
  config.vm.provision "shell", path: "scripts/install_go.sh"
  config.vm.provision "shell", path: "scripts/addhashicorprepo.sh"
end
