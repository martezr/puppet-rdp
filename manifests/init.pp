# Class: rdp
#
#  This class is used to enable/disable remote desktop and remote desktop network level authentication
#  A windows firewall rule named "Remote Desktop - Puppet" is automatically created in the event the windows firewall is enabled
# 
# == Parameters: 
#
#  $rdp_enable:: Whether RDP is enabled. Defaults to false or disabled.
#  Valid values: true and false
#
#  $rdp_nla_enable:: Whether Network Level Authentication is enabled. RDP needs to be enabled
#  for the setting to be effective. Defaults to false or disabled. 
#  Valid values: true and false
#
# == Requires:
#  puppetlabs/registry
#  puppetlabs/stdlib
#  rmsphd/windows_firewall
#
# == Sample Usage:
#
#  class {'rdp':
#   rdp_enable => true,
#   rdp_nla_enable => true,
#  }
#

class rdp (
  # Remote Desktop and NLA disabled by default
  $rdp_enable = false,
  $rdp_nla_enable = false,
) {

# Validate rdp class 
validate_bool($rdp_enable)
validate_bool($rdp_nla_enable)

# Remote Desktop Connection logic (Remote Desktop is enabled = 0, Remote Desktop is disabled = 1)
if $rdp_enable {
  $rdp_setting = '0'
}else{
  $rdp_setting = '1'
}

# Remote Desktop Network Level Authentication logic (Remote Desktop NLA is enabled = 1, Remote Desktop NLA is disabled = 0)
if $rdp_nla_enable {
  $rdp_nla_setting = '1'
}else{
  $rdp_nla_setting = '0'
}

# Remote Desktop Connection
registry::value { 'rdp':
  key   => 'HKLM\System\CurrentControlSet\Control\Terminal Server',
  value => 'fDenyTSConnections',
  type  => 'dword',
  data  => $rdp_setting,
}

# Remote Desktop Network Level Authentication
registry::value { 'rdp_nla':
  key   => 'HKLM\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp',
  value => 'UserAuthentication',
  type  => 'dword',
  data  => $rdp_nla_setting,
}

# Enable RDP Firewall Rule (Windows firewall is NOT enabled but the required rule is created)

windows_firewall::exception { 'rdp_firewall':
     ensure       => present,
     direction    => 'in',
     action       => 'allow',
     enabled      => 'yes',
     protocol     => 'TCP',
     local_port   => '3389',
     display_name => 'Remote Desktop - Puppet',
     description  => 'This exception allows RDP access (TCP 3389)',
   }


}
