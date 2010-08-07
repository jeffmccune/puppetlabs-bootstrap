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
  $class  = "${module}::mock"

  puppetlabs::account {
    "mock":
      uid      => 201,
      gid      => 201,
      comment  => "Fedora Mock Build",
      password => '!!';
  }
  package {
    "mock":
      ensure => "installed",
      require => [ Puppetlabs::Account["mock"] ];
   }
}

