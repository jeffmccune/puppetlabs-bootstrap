# $1$h1sO8/t5$7KwwnndbCBxV3zgwjh.zs0 is the hash for "puppet"

puppetlabs::rcfiles { "root": homedir => "/root" }

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
}
