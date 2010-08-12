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
  $mockhome = "/var/lib/mock"
  File {
    owner => "201",
    group => "201",
    mode  => "0644",
  }
  # $topdir used in rpmmacros template
  $topdir = $mockhome

  puppetlabs::account {
    "mock":
      uid      => 201,
      gid      => 201,
      homedir  => "${mockhome}",
      comment  => "Fedora Mock Build",
       password => '!!';
  }
  # JJM RPM Build Directories
  file {
    [ "${mockhome}/BUILD",
      "${mockhome}/RPMS",
      "${mockhome}/SRPMS",
      "${mockhome}/SOURCES",
      "${mockhome}/SPECS" ]: ensure => "directory";
    "${mockhome}/.rpmmacros":
      content => template("${module}/rpmmacros.erb");
  }
  Package { ensure => "latest" }
  package {
    "mock":
      require => [ Puppetlabs::Account["mock"] ];
    "rpm-build":;
    "redhat-rpm-config":;
    "make":;
    "gcc":;
  }
}

