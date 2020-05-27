Vagrant.configure("2") do |config|
  vagrantfile_directory= File.dirname(__FILE__)
  
  # checks
  if !Vagrant.has_plugin? 'vagrant-disksize'
		raise Vagrant::Errors::VagrantError.new,
        "install vagrant-disksize first:\nvagrant plugin install vagrant-disksize"
  end

  config.vm.box = "archlinux/archlinux"
  config.disksize.size = '30GB' 
  config.vm.provider "virtualbox" do |virtualbox|
    virtualbox.name = "default"
    virtualbox.memory = 4048
    virtualbox.cpus= 1
    virtualbox.customize ["modifyvm", :id, "--vram", "256"]
    virtualbox.gui = true
  end

  config.vm.synced_folder ".", "/home/vagrant/mount", automount: true
  config.vm.post_up_message = "complete"

  config.vm.provision "shell", name: "init", path: "provision/init.sh", env: {"RESOLUTION" => "800x600"}, privileged: true
  config.vm.provision "shell", name: "user", path: "provision/user.sh", privileged: false

  config.vm.provision "shell", name: "profile", path: "provision/profile.sh", privileged: false

end
