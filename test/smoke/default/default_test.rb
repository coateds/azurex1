# # encoding: utf-8

# Inspec test for recipe azurex1::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# Most of the following describe blocks will run choco list...
# and capture/test its output
describe command('choco list chocolatey --exact --local-only --limit-output') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match('chocolatey|') }
end

# describe command('choco list AzureStorageExplorer --exact --local-only --limit-output') do
#   its('exit_status') { should eq 0 }
#   its('stdout') { should match('AzureStorageExplorer|') }
# end

# describe command('choco list chefdk --exact --local-only --limit-output') do
#   its('exit_status') { should eq 0 }
#   its('stdout') { should match('chefdk|') }
# end

describe command('choco list git --exact --local-only --limit-output') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match('git|') }
end

# describe command('choco list sysinternals --exact --local-only --limit-output') do
#   its('exit_status') { should eq 0 }
#   its('stdout') { should match('sysinternals|') }
# end

# describe command('choco list poshgit --exact --local-only --limit-output') do
#   its('exit_status') { should eq 0 }
#   its('stdout') { should match('poshgit|') }
# end

# describe command('choco list pester --exact --local-only --limit-output') do
#   its('exit_status') { should eq 0 }
#   its('stdout') { should match('pester|') }
# end

# describe command('choco list rdcman --exact --local-only --limit-output') do
#   its('exit_status') { should eq 0 }
#   its('stdout') { should match('rdcman|') }
# end

# describe command('choco list visualstudiocode --exact --local-only --limit-output') do
#   its('exit_status') { should eq 0 }
#   its('stdout') { should match('visualstudiocode|') }
# end

# describe command('choco list putty --exact --local-only --limit-output') do
#   its('exit_status') { should eq 0 }
#   its('stdout') { should match('putty|') }
# end

# describe command('choco list curl --exact --local-only --limit-output') do
#   its('exit_status') { should eq 0 }
#   its('stdout') { should match('curl|') }
# end

describe command('choco list windowsazurepowershell --exact --local-only --limit-output') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match('windowsazurepowershell|') }
end

# This one package can be tested with the generic package test
# describe package('slack') do
#   it { should be_installed }
# end

describe command('$PSVersionTable.PSVersion') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match('5      1      14409  1005') }
end