#
# Cookbook:: azurex1
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'chocolatey::default'

chocolatey_package 'visualstudiocode'

chocolatey_package 'git' do
  options '--params /GitAndUnixToolsOnPath'
end

cookbook_file 'Win8.1AndW2K12R2-KB3191564-x64.msu' do
	source 'Win8.1AndW2K12R2-KB3191564-x64.msu'
end

reboot 'Restart Computer' do
  action :nothing
end

msu_package 'Install Windows WMF5.1 KB3191564' do
  source 'Win8.1AndW2K12R2-KB3191564-x64.msu'
  # action :remove
  action :install
  notifies :reboot_now, 'reboot[Restart Computer]', :immediately
end