# NOTE: attributes are case sensitive!!
# set the following attributes to 'y' to install/upgrade
default['install-packages']['upgrade-chocolatey'] = 'n'

default['install-packages']['git']             = 'y'
default['install-packages']['vscode']          = 'n'
default['install-packages']['putty']           = 'n'
default['install-packages']['curl']            = 'n'
default['install-packages']['azstorexplorer']  = 'n'
default['install-packages']['chefdk']          = 'n'
default['install-packages']['sysinternals']    = 'n'
default['install-packages']['poshgit']         = 'n'
default['install-packages']['pester']          = 'n'
default['install-packages']['rdcman']          = 'n'
default['install-packages']['slack']           = 'n'

# packages that require a reboot, set the requestreboot attribute to 'y' as well
default['install-packages']['powershell51']    = 'y'
default['install-packages']['winazpowershell'] = 'y'
default['install-packages']['requestreboot']   = 'n'