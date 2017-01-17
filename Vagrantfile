# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  (1..2).each do |i|
    config.vm.define "vector_tiler0#{i}" do |vector_tiler|
      vector_tiler.vm.box = "nrel/CentOS-6.5-x86_64"
      vector_tiler.vm.hostname = "vector-tile0#{i}"
      vector_tiler.vm.network "private_network", ip: "192.168.33.2#{i}"
      vector_tiler.vm.network "forwarded_port", guest: 8080, host: "888#{i}".to_i

      vector_tiler.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 1
      end
      
      vector_tiler.push.define "atlas" do |push|
        push.app = "lmrakai/vector_tiler0s#{i}"
      end
    end
  end

  config.vm.define "db" do |db|
    db.vm.box = "nrel/CentOS-6.5-x86_64"
    db.vm.hostname = "db"
    db.vm.network "private_network", ip: "192.168.33.30"
    db.vm.network "forwarded_port", guest: 9200, host: 9292

    db.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
    
    db.push.define "atlas" do |push|
      push.app = "lmrakai/db"
    end
  end

  config.vm.define "monitor" do |monitor|
    monitor.vm.box = "nrel/CentOS-6.5-x86_64"
    monitor.vm.hostname = "monitor"
    monitor.vm.network "private_network", ip: "192.168.33.40"
    monitor.vm.network "forwarded_port", guest: 5601, host: 15601
    
    monitor.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
    
    monitor.push.define "atlas" do |push|
      push.app = "lmrakai/monitor"
    end
  end

  config.vm.define "load_balancer" do |load_balancer|
    load_balancer.vm.box = "nrel/CentOS-6.5-x86_64"
    load_balancer.vm.hostname = "load-balancer"
    load_balancer.vm.network "private_network", ip: "192.168.33.50"
    load_balancer.vm.network "forwarded_port", guest: 80, host: 8080
    
    load_balancer.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
    
    load_balancer.push.define "atlas" do |push|
      push.app = "lmrakai/load_balancer"
    end
  end

  config.vm.define "controller", primary: true do |controller|
    controller.vm.box = "ubuntu/trusty64"
    controller.vm.hostname = "controller"
    controller.vm.network "private_network", ip: "192.168.33.10"

    controller.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end

    controller.push.define "atlas" do |push|
      push.app = "lmrakai/controller"
    end

    controller.vm.provision "shell", path: "controller-provision.sh"
  end

end
