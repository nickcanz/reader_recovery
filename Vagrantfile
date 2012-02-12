Vagrant::Config.run do |all_config|
  all_config.vm.define :base_box do |config|
    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = "base_redux"

    config.vm.forward_port 3000, 3000

    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "~/development/cookbooks"
      chef.add_recipe "reader_recovery"
      chef.json.merge!({
        'postgresql' => {
          'password' => {
            'postgres' => 'password'
          }
        }
      })
    end
  end
end
