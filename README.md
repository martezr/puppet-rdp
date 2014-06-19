# puppet-rdp

Puppet module to RDP on Windows platforms

===

# Compatability

This module has been tested to work on the following systems with Puppet v3 and Ruby versions 1.8.7, 1.9.3 and 2.0.0.

 * Windows Server 2008 R2
 * Windows Server 2012 R2

===

# Parameters

rdp_enable
-----------
Enable RDP

- *Default*: false

rdp_nla_enable
---------------------------
Enable network level authentication.

- *Default*: false

===

## Sample usage:
Enable RDP

<pre>
class { 'rdp':
  rdp_enable => true,
  rdp_nla_enable => true,
  }
</pre>
