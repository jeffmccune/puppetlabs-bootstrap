# Define: puppetlabs::masterhostname
#
#   2010-07-17 Jeff McCune <jeff@puppetlabs.com>
#
#   This defined resource type manages the hostname of the
#   master in order to provide correct name resolution of
#   the "cname" puppet.
#
#   It does so by managing the /etc/hosts entry for the puppet
#   master.
#
# Parameters:
#
#   ipaddress => The IPv4 address of the puppet master.
#   fqdn      => The fully qualified domain name of the master.
#                 (Defaults to the resource title)
#   aliases   => The aliases of the master (Default => ["puppet"])
#
# Actions:
#
#   Manages /etc/hosts to create an entry for "puppet"
#
# Requires:
#
# Sample Usage:
#
#   puppetlabs::masterhostname { "puppet.puppetlabs.lan":
#     ipaddress => "192.168.69.32",
#   }
#
define puppetlabs::masterhostname($ipaddress,
                                  $fqdn=false,
                                  $aliases=["puppet"])
{
  notify { "${name} is unimplemented": }
}
# EOF
