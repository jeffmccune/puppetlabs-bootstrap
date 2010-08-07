# Class: puppetlabs::selinux
#
#   Disable SELinux
#   Jeff McCune <jeff@puppetlabs.com>
#   2010-08-07
#
# Parameters:
#
# Actions:
#
#   Manages /etc/sysconfig/selinux
#
# Requires:
#
# Sample Usage:
#
#   include puppetlabs::selinux
#
class puppetlabs::selinux {
  $module = "puppetlabs"
  $class  = "${module}::selinux"
  File { owner => "0", group => "0", mode  => "0644" }
  file {
    "/etc/selinux/config":
      content => template("${module}/etc/selinux/config");
  }
  exec {
    "selinux":
      command => "/usr/sbin/setenforce 0",
      onlyif  => "/bin/bash -c '/usr/sbin/getenforce | /bin/grep -qx Enforcing'"
  }
}
