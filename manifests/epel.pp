# Extra Packages for Enterprise Linux (or EPEL) is a Fedora Special
# Interest Group that creates, maintains, and manages a high quality
# set of additional packages for Enterprise Linux, including, but
# not limited to, Red Hat Enterprise Linux (RHEL),CentOS and
# Scientific Linux (SL).
class repo_epel::epel inherits repo_epel::params {
  
  #file { "/etc/yum.repos.d/epel${::operatingsystemmajrelease}.repo": ensure => absent, }
    
  yumrepo { 'epel':
    baseurl  => "${repourl}/${urlbit}/${::architecture}",
    descr    => "Extra Packages for Enterprise Linux (EPEL) Repository - EL${::operatingsystemmajrelease} - ${::architecture}",
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${::operatingsystemmajrelease}",
    priority => '11',
  }

}
