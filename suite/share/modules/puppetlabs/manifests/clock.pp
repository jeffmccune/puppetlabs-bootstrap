# Class: puppetlabs::clock
#
#   This class manages the NTP clock synchronization
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class puppetlabs::clock {
  $module = "puppetlabs"
  package { "ntp":
    ensure => present,
    before => File["ntp.conf"],
  }
  file {
    "ntp.conf":
      path => "/etc/ntp.conf",
  }
  service {
    "ntpd":
      ensure    => running,
      enable    => true,
      hasstatus => true,
  }
}
# JJM EOF
