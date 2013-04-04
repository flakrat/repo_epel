class repo_elrepo::extras  (
  $enable_extras = false,
) inherits repo_elrepo::params {

  if $enable_extras {
    $enabled = 1
  } else {
    $enabled = 0
  }
  
  yumrepo { 'elrepo-extras':
    baseurl  => "${url}/extras/${urlbit}/${::architecture}",
    descr    => "ELRepo.org Community Enterprise Linux Extras Repository - el${::os_maj_version} - ${::architecture}",
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org",
    priority => '11',
  }

}