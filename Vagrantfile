VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/centos-7.0"

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = "~/.ssh/id_rsa"
    override.vm.box = "AndrewDryga/digital-ocean"
    provider.token  = ENV["DIGITALOCEAN_ACCESS_TOKEN"]
    provider.image  = "CentOS 7.0 x64"
    provider.region = "sgp1"
    provider.size   = "512MB"

    if ENV['WERCKER'] == "true"
      provider.ssh_key_name = "wercker"
    else
      provider.ssh_key_name = "My MacBook Air"
    end
  end

  config.vm.provision :shell, inline: <<-EOF
    sudo rpm -i \
    http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
    sudo yum install -y puppet
  EOF

  config.vm.define :app do |c|
    c.vm.provision :shell do |shell|
      shell.path = "provision.sh"
      shell.args = "app"
    end
  end

  config.vm.define :proxy do |c|
    c.vm.provision :shell do |shell|
      shell.path = "provision.sh"
      shell.args = "proxy"
    end
  end
end
