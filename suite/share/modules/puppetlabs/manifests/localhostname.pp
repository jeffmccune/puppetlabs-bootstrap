# Define: puppetlabs::localhostname
#
#   2010-07-17 Jeff McCune <jeff@puppetlabs.com>
#
#   This defined resource type manages the local hostname
#   Tested on Enterprise Linux 5.x
#
# Parameters:
#
#   hostname   => The short hostname of the local node.
#                 (Defaults to the resource label)
#   hostdomain => The domain of the machine
#                 (Defaults to $domain fact)
#   address    => The IP address of the primary interface
#                 (Defaults to $ipaddress fact)
#   aliases    => Aliases for the local node
#
# Actions:
#
#   Manages /etc/sysconfig/network
#   Sets hostname using /bin/hostname
#
# Requires:
#
# Sample Usage:
#
define puppetlabs::localhostname($hostname   = false,
                                 $hostdomain = false,
                                 $address    = false,
                                 $aliases    = false,)
{
  # Variables
  $module          = "puppetlabs"
  $hostname_real   = $hostname ? { false => $name, default => $hostname }
  $hostdomain_real = $hostdomain ? { false => $domain, default => $hostdomain }
  $address_real    = $address ? { false => $ipaddress, default => $address }
  $aliases_real    = $aliases ? { false => $hostname_real, default => $aliases }
  $fqdn_real       = "${hostname_real}.${hostdomain_real}"
  # Resource defaults
  File {
    owner => "0",
    group => "0",
    mode  => "644",
  }
  # Resources
  exec {
    "set-hostname-${hostname_real}":
      command => "/bin/hostname ${fqdn_real}",
      unless  => "/bin/hostname | /bin/grep -qx ${fqdn_real}",
  }
  file {
    "/etc/sysconfig/network":
      content => template("${module}/sysconfig_network.erb");
  }
  host {
    "${fqdn_real}":
      host_aliases => $aliases_real,
      ensure       => "present",
      ip           => "${address_real}";
  } # host
}
# EOF
