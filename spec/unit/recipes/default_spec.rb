#
# Cookbook:: azurex1
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'azurex1::default' do
  context 'When all attributes are default, on a Windows 2012R2' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2')
      runner.converge(described_recipe)
    end

    # package installation section

    # NOTE: There is no unit test for the default recipe of chocolatey installation of Chocolatey
    # Or is there?
    it 'install chocolatey' do
      expect(chef_run).to include_recipe('chocolatey')
    end

    # Select and test for the packages desired in a particular build

    # The ChefSpec/RSpec unit testing process will respect Ruby code and attributes
    # For instance the install-packages recipe will be written to install
    # packages depending on whether an attribute is set to 'y'. The ChefSpec/RSpec
    # process will pass or fail depending on how this attribute is set and consumed
    # in a conditional within the recipe

    # Will pass if the attribute is set
    # it 'installs a package' do
    #   expect(chef_run).to install_chocolatey_package('visualstudiocode')
    # end

    # Here is an example with options
    it 'installs a package with options' do
      expect(chef_run).to install_chocolatey_package('git').with(
        options: '--params /GitAndUnixToolsOnPath'
      )
    end

    # Test for a list of apps
    # Each item will be treated as a single test
    #%w(chefdk putty sysinternals curl poshgit pester rdcman slack azurestorageexplorer).each do |item|
    #  it 'installs a package' do
    #    expect(chef_run).to install_chocolatey_package(item)
    #  end
    #end

    # The following installation will require a reboot
    it 'installs a package' do
      expect(chef_run).to install_chocolatey_package('windowsazurepowershell')
      # ref:https://github.com/chefspec/chefspec for next line. Does not work, but I think is close
      # another ref: https://chefspec.github.io/chefspec/
      # expect(chef_run).to notify('reboot[restart-computer]').to(:reboot_now).delayed
    end

    # I believe what this expects is to reboot the computer at the end of the client run
    # regardless of what other actions are taken
    # NOTE: 'restart-computer' must match exactly to the name of the reboot block
    # with the action :request_reboot
    #it 'runs a request_reboot' do
    #  expect(chef_run).to request_reboot('restart-computer')
    #end

    # However, this reboot scenario does not cover the intent to reboot ONLY if a particular
    # resource block is run. An attempt to make this work with a notifies option in the chocolatey_package
    # resource of the recipe revealed this not to be a good strategy. Best seems to make it run
    # as a conditional to an attribute and explicitly include it here when needed

    it 'creates the file Win8.1AndW2K12R2-KB3191564-x64.msu in cache' do
      expect(chef_run).to create_cookbook_file('Win8.1AndW2K12R2-KB3191564-x64.msu')
    end

    it 'installs a msu_package Win8.1AndW2K12R2-KB3191564-x64.msu' do
      expect(chef_run).to install_msu_package('Win8.1AndW2K12R2-KB3191564-x64.msu')
    end
    # /package installation section

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
