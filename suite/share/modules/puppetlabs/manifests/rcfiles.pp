# Define: puppetlabs::rcfiles
#
#   Jeff McCune <jeff@puppetlabs.com>
#   2010-08-03
#
#   Deploy rcfiles into a user home directory
#   Designed to work with root and normal users
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
define puppetlabs::rcfiles($user=false, $group=false, $homedir=false) {
	$module = "puppetlabs"
	$source = "puppet:///modules/${module}"
	$uid_real = $user  ? { false => $name, default => $user }
	$gid_real = $group ? { false => undef, default => $group }
	$homedir_real = $homedir ? {
		false => "/home/${uid_real}",
		default => $homedir
  }
####
  File {
    owner => $uid_real,
    group => $gid_real,
    mode => "0644",
    replace => false,
  }
####
	file {
    "${homedir_real}/.bashrc":
      mode => "0755",
      source => "${source}/bashrc";
    "${homedir_real}/.bash_profile":
      mode => "0755",
      source => "${source}/bash_profile";
    "${homedir_real}/.screenrc":
      source => "${source}/screenrc";
    "${homedir_real}/.vim":
      ensure => directory,
      source => "${source}/vim",
      recurse => true;
    "${homedir_real}/.vimrc":
      source => "${source}/vimrc";
	}
}
