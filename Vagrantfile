# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y subversion build-essential libncurses5-dev zlib1g-dev gawk git ccache gettext libssl-dev xsltproc git

    echo "Add github.com to known_hosts"
    mkdir -p /root/.ssh
    if [ ! -f /root/.ssh/known_hosts ]; then
      touch /root/.ssh/known_hosts && ssh-keyscan -H github.com >> /root/.ssh/known_hosts && chmod 600 /root/.ssh/known_hosts
    fi

    pushd /home/vagrant
      git clone git@github.com:shuhaowu/wrtfreezer.git
      cd wrtfreezer

      sudo python setup.py install
    popd
  SHELL

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/home/vagrant/trafficcop"
end
