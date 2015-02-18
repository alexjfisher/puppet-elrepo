class elrepo::params {
  # Setting to 'absent' will fall back to the yum.conf
  # Setting proxy here will be the default for all repos.
  #
  # If you wish to set a proxy for an individual set of repos,
  # you can declare $proxy in that class, and should scope to
  # the most specific declaration of proxy.
  $proxy             = 'absent'

  $elrepo_baseurl            = 'absent'
  $elrepo_mirrorlist         = "http://mirrors.elrepo.org/mirrors-elrepo.el${::operatingsystemmajrelease}"
  $elrepo_proxy              = $proxy
  $elrepo_enabled            = '1'
  $elrepo_gpgcheck           = '1'
  $elrepo_protect            = '0'

  $elrepo_testing_baseurl    = 'absent'
  $elrepo_testing_mirrorlist = "http://mirrors.elrepo.org/mirrors-elrepo-testing.el${::operatingsystemmajrelease}"
  $elrepo_testing_proxy      = $proxy
  $elrepo_testing_enabled    = '0'
  $elrepo_testing_gpgcheck   = '1'
  $elrepo_testing_protect    = '0'

  $elrepo_kernel_baseurl     = 'absent'
  $elrepo_kernel_mirrorlist  = "http://mirrors.elrepo.org/mirrors-elrepo-kernel.el${::operatingsystemmajrelease}"
  $elrepo_kernel_proxy       = $proxy
  $elrepo_kernel_enabled     = '0'
  $elrepo_kernel_gpgcheck    = '1'
  $elrepo_kernel_protect     = '0'

  $elrepo_extras_baseurl     = 'absent'
  $elrepo_extras_mirrorlist  = "http://mirrors.elrepo.org/mirrors-elrepo-extras.el${::operatingsystemmajrelease}"
  $elrepo_extras_proxy       = $proxy
  $elrepo_extras_enabled     = '0'
  $elrepo_extras_gpgcheck    = '1'
  $elrepo_extras_protect     = '0'

}
