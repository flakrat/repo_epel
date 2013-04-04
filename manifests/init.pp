# Class: repo_elrepo
#
# This module manages repo_elrepo
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage: include repo_elrepo
#
class repo_elrepo (
  $enable_testing = false,
  $enable_kernel = false,
  $enable_extras = false,
) inherits repo_elrepo::params {

  if $::osfamily == 'RedHat' {
    include repo_elrepo::elrepo
    class { "repo_elrepo::testing":
      enable_testing   => $enable_testing,
    }
    class { "repo_elrepo::kernel":
      enable_kernel   => $enable_kernel,
    }
    class { "repo_elrepo::extras":
      enable_extras   => $enable_extras,
    }

    repo_elrepo::rpm_gpg_key{ "RPM-GPG-KEY-elrepo.org":
      path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org",
    }

    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org":
      ensure => present,
      owner  => 0,
      group  => 0,
      mode   => '0644',
      source => "puppet:///modules/repo_elrepo/RPM-GPG-KEY-elrepo.org",
    }

  } else {
      notice ("Your operating system ${::operatingsystem} is not supported for ELRepo repositories")
  }

}
