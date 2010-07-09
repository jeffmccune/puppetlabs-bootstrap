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

# Set the default suite as a facter fact if not already set
: ${FACTER_PLABS_SUITE:=bootstrap}
export FACTER_PLABS_SUITE

## Functions ##
SetupEnviornment() {
  # This function sets up RUBYLIB and PATH
  if [ -z "${facter_plabs_suite_envissetup:-}" ]; then
    facter_plabs_suite_envissetup=true
    PATH="${FACTER_PLABS_PREFIX}/suite/${FACTER_PLABS_SUITE}/bin:${PATH}"
    RUBYLIB="${FACTER_PLABS_PREFIX}/suite/${FACTER_PLABS_SUITE}/lib:${RUBYLIB}"
    export PATH RUBYLIB
  fi
}

Debug() {
  # Write a message to STDERR if DEBUG is "true"
  if [ ${DEBUG:-false} == "true" ]; then
    echo "$@" >&2
  fi
  return 0
}

# EOF
