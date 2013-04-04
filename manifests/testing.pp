class repo_elrepo::testing  (
  $enable_testing = false,
) inherits repo_elrepo::params {

  if $enable_testing {
    $enabled = 1
  } else {
    $enabled = 0
  }
  
  yumrepo { 'elrepo-testing':
    baseurl  => "${url}/testing/${urlbit}/${::architecture}",
    descr    => "ELRepo.org Community Enterprise Linux Testing Repository - el${::os_maj_version} - ${::architecture}",
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org",
    priority => '11',
  }

}