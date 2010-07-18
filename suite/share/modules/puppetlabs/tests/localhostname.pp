# 2010-07-18 Jeff McCune <jeff@puppetlabs.com>
#
# This manifest provides an example to test the
# puppetlabs::localhostname defined resource type.
#
puppetlabs::localhostname { "puppet":
  hostdomain => "puppetlabs.lan",
  address    => "${ipaddress}",
}
# EOF

