class repo_elrepo::elrepo inherits repo_elrepo::params {  
  yumrepo { 'elrepo':
    baseurl  => "${url}/elrepo/${urlbit}/${::architecture}",
    descr    => "ELRepo.org Community Enterprise Linux Repository - el${::os_maj_version} - ${::architecture}",
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org",
    priority => '11',
  }

}