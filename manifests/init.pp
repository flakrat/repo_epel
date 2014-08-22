# == Class: repo_epel
#
# Configure the CentOS 5 or 6 repositories and import GPG keys
#
# === Parameters:
#
# $repourl::                       The base repo URL, if not specified defaults to the
#                                  EPEL Mirror
#                                  
# $enable_epel::                   Enable the EPEL Repo
#                                  type:boolean
#
# $enable_debuginfo::              Enable the EPEL Debuginfo Repo
#                                  type:boolean
#
# $enable_source::                 Enable the EPEL source Repo
#                                  type:boolean
#
# $enable_testing::                Enable the EPEL testing Repo
#                                  type:boolean
#
# $enable_testing_debuginfo::      Enable the EPEL testing debuginfo Repo
#                                  type:boolean
#
# $enable_testing_source::         Enable the EPEL testing source Repo
#                                  type:boolean
#
# === Usage:
# * Simple usage:
#
#  include repo_epel
#
# * Advanced usage:
#
#   class {'repo_epel':
#     repourl       => 'http://myrepo/centos',
#     enable_scl    => true,
#   }
#
# * Alternate usage via hiera YAML:
#
#   repo_epel::repourl: 'http://myrepo/centos'
#   repo_epel::enable_scl: true
#
class repo_epel (
    $repourl                       = $repo_epel::params::repourl,
    $enable_epel                   = $repo_epel::params::enable_epel,
    $enable_debuginfo              = $repo_epel::params::enable_epel_debuginfo,
    $enable_source                 = $repo_epel::params::enable_epel_source,
    $enable_testing                = $repo_epel::params::enable_epel_testing,
    $enable_testing_debuginfo      = $repo_epel::params::enable_epel_testing_debuginfo,
    $enable_testing_source         = $repo_epel::params::enable_epel_testing_source,
  ) inherits repo_epel::params {

  validate_string($repourl)
  validate_bool($enable_epel)
  validate_bool($enable_epel_debuginfo)
  validate_bool($enable_epel_source)
  validate_bool($enable_epel_testing)
  validate_bool($enable_epel_testing_debuginfo)
  validate_bool($enable_epel_testing_source)
  
  if $::osfamily == 'RedHat' {
    include repo_epel::epel
    
    repo_epel::rpm_gpg_key{ "RPM-GPG-KEY-EPEL-${::os_maj_version}":
      path => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${::os_maj_version}",
    }

    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${::os_maj_version}":
      ensure => present,
      owner  => 0,
      group  => 0,
      mode   => '0644',
      source => "puppet:///modules/repo_epel/RPM-GPG-KEY-EPEL-${::os_maj_version}",
    }

  } else {
      notice ("Your operating system ${::operatingsystem} does not need EPEL repositories")
  }

}
