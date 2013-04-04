# Optional parameters in setting up ELRepo Yum repository
class repo_elrepo::params {
  # Setting to 'absent' will fall back to the yum.conf
  # Setting proxy here will be the default for all repos.
  #
  #  If you wish to set a proxy for an individual set of repos,
  #   you can declare $proxy in that class, and should scope to
  #   the most specific declaration of proxy.
  $proxy = 'absent'

  # There are some URL manipulations that have to happen based on exact OS type
  if $::osfamily == 'RedHat' {
    $url = "http://192.168.2.10/repo/elrepo"
    $ostype = 'el'
    $urlbit = "${ostype}${::os_maj_version}"
  }
}
