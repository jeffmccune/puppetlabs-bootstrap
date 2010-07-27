# Class: puppetlabs::mock
#
#   This class sets up the mock build system on a host.
#   http://fedoraproject.org/wiki/Projects/Mock
#
#   Mock creates chroots and builds packages in them.
#   Its only task is to reliably populate a chroot and
#   attempt to build a package in that chroot.
#
# Parameters:
#
# Actions:
#
#  Manage User[mock]
#  Manage Group[mock]
#  Manage Package[mock]
#
# Requires:
#
# Sample Usage:
#
class puppetlabs::mock {
  $module = "puppetlabs"
  # statements
  user {
    "mock":
      ensure     => "present",
      gid        => "mock",
      home       => "/var/lib/mock",
      comment    => "Fedora Mock Build",
      shell      => "/bin/bash",
  }
  group { "mock": ensure => "present" }
  package {
    "mock":
      ensure => "installed",
      require => [ User["mock"] ],
   }
}

