# 2010-07-09 Jeff McCune <jeff@puppetlabs.com>
#
# Common bash functions
#
# This file must work when sourced directly from an interactive shell
#

set -u

## Variables ##
# Set the default puppetlabs prefix as a facter fact if not already set
: ${FACTER_PLABS_PREFIX:=/opt/puppetlabs}
export FACTER_PLABS_PREFIX

## Functions ##
Debug() {
  # Write a message to STDERR if DEBUG is "true"
  if [ ${DEBUG:-false} == "true" ]; then
    echo "$@" >&2
  fi
  return 0
}

# EOF
