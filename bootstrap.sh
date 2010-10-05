#!/bin/bash
# to use:
# curl http://github.com/puppetlabs/puppetlabs-bootstrap/raw/master/bootstrap.sh | bash
rpm -ql zsh > /dev/null || yum install -y zsh
mkdir -p /opt/puppetlabs
cd /opt/puppetlabs
[ -d /opt/puppetlabs/puppetlabs-bootstrap ] || git clone git://github.com/puppetlabs/puppetlabs-bootstrap.git

echo ${PATH} | grep -q puppetlabs-bootstrap || export PATH=/opt/puppetlabs/puppetlabs-bootstrap/bin:$PATH

for command in pb_init_00_epel pb_init_10_ruby pb_init_11_git  pb_init_50_puppet pb_init_51_facter pb_setup_11_selinuxoff pb_setup_20_mock ; do 
  echo "Running ${command}"
  eval ${command} || exit 1
done

exit 0 
# these might break aws
#pb_init_20_sshauthorizedkeys
#pb_init_30_puppetusergroup
#pb_init_40_account
#pb_init_41_sudo
#pb_runmanifest
#pb_update
#puppet-bootstrap
