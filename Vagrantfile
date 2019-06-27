Vagrant.configure("2") do |config|
  vagrantfile_directory= File.dirname(__FILE__)
  
  # plugin check
  if !Vagrant.has_plugin? 'vagrant-disksize'
		raise Vagrant::Errors::VagrantError.new,
        "vagrant-disksize missing, please install the plugin:\nvagrant plugin install vagrant-disksize"
  else
      
	  #vm settings
      config.vm.box = "archlinux/archlinux"
	  config.disksize.size = '30GB' 
	  config.vm.provider "virtualbox" do |virtualbox|
		virtualbox.name = "ArchLinux"
		virtualbox.memory = 2024
		virtualbox.cpus= 4
		virtualbox.customize ["modifyvm", :id, "--vram", "60"]
		virtualbox.gui = true
		
	  end
	  config.vm.synced_folder ".", "/home/vagrant/workspace"
	  config.vm.post_up_message = "Installation finished! Have fun!"

	if ARGV[0] == "up"
	
	  #Selection of resolution & other modules for guest system 
	  print "Enter your video resolution (e.g. 1920x1080): "
	  VIDEO_RESOLUTION = STDIN.gets.chomp
	  print "Install zsh + settings [Y/n]: "
	  ZSH_PROVISION_FLAG = STDIN.gets.chomp
	  print "Install vim + settings [Y/n]: "
	  VIM_PROVISION_FLAG = STDIN.gets.chomp
	  print "Install development tools [Y/n]: "
	  DEVTOOLS_PROVISION_FLAG = STDIN.gets.chomp
	  
	  # base installation
	  config.vm.provision "shell", path: "scripts/base_provision.sh", env: {"RESOLUTION" => VIDEO_RESOLUTION}, privileged: false
	  
	  # zsh installation
	  if ZSH_PROVISION_FLAG == "y" || ZSH_PROVISION_FLAG == "Y" || ZSH_PROVISION_FLAG == "" 
        vagrant_root = File.dirname(__FILE__)	  
		config.vm.provision "shell", path: "scripts/zsh_provision.sh", privileged: false
		config.vm.provision "file", source: vagrantfile_directory+"/resources/agnoster.zsh-theme", destination: "/home/vagrant/.oh-my-zsh/themes/agnoster.zsh-theme"
	  end
	 
	  # vim installation
	  if VIM_PROVISION_FLAG == "y" || VIM_PROVISION_FLAG == "Y" || VIM_PROVISION_FLAG == ""  
	  	config.vm.provision "file", source: vagrantfile_directory+"/resources/.vimrc", destination: "/home/vagrant/.vimrc"
		config.vm.provision "file", source: vagrantfile_directory+"/resources/ycm_extra_conf.py", destination: "/home/vagrant/.vim/ycm_extra_conf.py"
		config.vm.provision "shell", path: "scripts/vim_provision.sh", privileged: false
	  end 
	  
	  # dev tools installation
	  if DEVTOOLS_PROVISION_FLAG == "y" || DEVTOOLS_PROVISION_FLAG == "Y" || DEVTOOLS_PROVISION_FLAG == ""  
		config.vm.provision "shell", path: "scripts/dev_provision.sh", privileged: false
	  end 
	end
  end
end