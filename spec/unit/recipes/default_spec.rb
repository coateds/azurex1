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

    it 'installs a package' do
      expect(chef_run).to install_chocolatey_package('visualstudiocode')
    end

    it 'installs a package with options' do
      expect(chef_run).to install_chocolatey_package('git').with(
        options: '--params /GitAndUnixToolsOnPath'
      )
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
