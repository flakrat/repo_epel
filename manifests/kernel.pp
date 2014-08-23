class repo_elrepo::kernel  (
  $enable_kernel = false,
) inherits repo_elrepo::params {

  if $enable_kernel {
    $enabled = 1
  } else {
    $enabled = 0
  }
  
  yumrepo { 'elrepo-kernel':
    baseurl  => "${url}/kernel/${urlbit}/${::architecture}",
    descr    => "ELRepo.org Community Enterprise Linux Kernel Repository - el${::os_maj_version} - ${::architecture}",
    enabled  => '0',
    gpgcheck => '1',
    gpgkey   => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org",
    priority => '11',
  }

}