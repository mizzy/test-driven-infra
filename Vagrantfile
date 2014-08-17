VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/centos-7.0"

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
end
