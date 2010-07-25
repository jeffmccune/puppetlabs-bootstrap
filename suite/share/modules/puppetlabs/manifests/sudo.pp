# Class: puppetlabs::sudo
#
#   Setup and manage a basic sudoers file
#
# Parameters:
#
# Actions:
#
#  Manages Package["sudo"] (installed)
#  Manages File["/etc/sudoers"] (source)
#
# Requires:
#
#  None
#
# Sample Usage:
#
#  include puppetlabs::sudo
#
class puppetlabs::sudo {
  $module = "puppetlabs"
  $source = "puppet:///modules/${module}"
  if ! defined(Package["sudo"]) {
    package { "sudo": ensure => "installed" }
  }
  File { owner => "0", group => "0", mode => "0644" }
  file {
    "/etc/sudoers":
      mode => "0440",
      require => Package["sudo"],
      source => "${source}/sudoers";
  }
}

