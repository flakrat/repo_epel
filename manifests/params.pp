# Optional parameters in setting up CentOS Yum repository
class repo_epel::params {
  # el5
  # epel                       mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-5&arch=$basearch
  # epel-debuginfo             mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-debug-5&arch=$basearch
  # epel-source                mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-source-5&arch=$basearch
  #
  # el5 testing
  # epel-testing               mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=testing-epel5&arch=$basearch
  # epel-testing-debuginfo     mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=testing-debug-epel5&arch=$basearch
  # epel-testing-source        mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=testing-source-epel5&arch=$basearch
  #
  # el6
  # epel                       mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch
  # epel-debuginfo             mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-debug-6&arch=$basearch
  # epel-source                mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-source-6&arch=$basearch
  #
  # el6 testing                
  # epel-testing               mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-epel6&arch=$basearch
  # epel-testing-debuginfo     mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel6&arch=$basearch
  # epel-testing-source        mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel6&arch=$basearch
  #
  #                            baseurl  => "${repourl}/${urlbit}/os/${::architecture}",
  $repourl = $::lsbmajdistrelease ? {
    5         => 'mirrorlist=http://mirrors.fedoraproject.org/mirrorlist?repo=epel-5&arch=$basearch',
    6         => 'mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
    default   => undef,
  }
  $enable_epel                    = true
  $enable_epel_debuginfo          = false
  $enable_epel_source             = false
  $enable_epel_testing            = false
  $enable_epel_testing_debuginfo  = false
  $enable_epel_testing_source     = false
  $ostype                         = 'EL'
  $urlbit = "${::operatingsystemmajrelease}"
}
