# Jeff McCune <jeff@puppetlabs.com> 2010-08-03
# NOTE: This is "finished" and working as far as I'm concerned.
#
# The init_40_account script calls this manifest.

# Don't manage the root account, but deploy RC Files to root
puppetlabs::rcfiles { "root": homedir => "/root" }

# This sets up accounts for all of Professional Services
Puppetlabs::Account { password => '!!' }
puppetlabs::account { "jeff":
  uid     => 402,
  gid     => 402,
  comment => "Jeff McCune",
}
puppetlabs::account { "teyo":
  uid     => 403,
  gid     => 403,
  comment => "Teyo Tyree",
}
puppetlabs::account { "dan":
  uid     => 404,
  gid     => 404,
  comment => "Dan Bode",
}
puppetlabs::account { "nan":
  uid     => 405,
  gid     => 405,
  comment => "Nan Liu",
}
puppetlabs::account { "cody":
  uid     => 406,
  gid     => 406,
  comment => "Cody Herriges",
}
puppetlabs::account { "james":
  uid     => 407,
  gid     => 407,
  comment => "James Turnbull",
}
puppetlabs::account { "zach":
  uid     => 408,
  gid     => 408,
  comment => "Zach Leslie",
}
# EOF
