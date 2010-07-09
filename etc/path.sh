# 2010-07-09 Jeff McCune <jeff@puppetlabs.com>
#
# Setup a sensible base path.
#

# Set default prefix
: ${FACTER_PLABS_PREFIX:=/opt/puppetlabs}

PATH="/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin"
PATH="${FACTER_PLABS_PREFIX}/bin:${FACTER_PLABS_PREFIX}/puppetlabs-bootstrap/bin:${PATH}"
export PATH
