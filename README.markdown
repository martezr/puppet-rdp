# Windows RDP Module

##Overview

Puppet module to enable/disable Remote Desktop and RDP Network Level Authentication. A windows firewall is automatically
created in the event the windows firewall is enabled. The firewall is NOT turned on automatically. 


###Setup Requirements

Depends on the following modules:

[puppetlabs/registry](https://forge.puppetlabs.com/puppetlabs/registry)

[puppetlabs/stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib)

[rmsphd/windows_firewall](https://forge.puppetlabs.com/rmsphd/windows_firewall)

##Usage

Class: rdp

        class { 'rdp':
          rdp_enable => true,
          rdp_nla_enable => true,
        }

Parameters:
  $rdp_enable
  $rdp_nla_enable

Both parameters accept boolean true and false

##Tested Operating Systems

Supported on Windows Server 2008R2.

##Contact

* Martez Reed <martez.reed@greenreedtech.com>