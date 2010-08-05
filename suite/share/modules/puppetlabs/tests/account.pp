# Jeff McCune <jeff@puppetlabs.com> 2010-08-03
# NOTE: This is "finished" and working as far as I'm concerned.
#
# The init_40_account script calls this manifest.

# Don't manage the root account, but deploy RC Files to root
puppetlabs::rcfiles { "root": homedir => "/root" }

# This sets up accounts for all of Professional Services
puppetlabs::account {
  "jeff":
    uid      => 402,
    gid      => 402,
    comment  => "Jeff McCune",
    password => '!!';
  "teyo":
    uid      => 403,
    gid      => 403,
    comment  => "Teyo Tyree",
    password => '!!';
  "dan":
    uid      => 404,
    gid      => 404,
    comment  => "Dan Bode",
    password => '!!';
  "nan":
    uid      => 405,
    gid      => 405,
    comment  => "Nan Liu",
    password => '!!';
  "cody":
    uid      => 406,
    gid      => 406,
    comment  => "Cody Herriges",
    password => '!!';
}
