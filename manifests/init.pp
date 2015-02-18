#  Class: elrepo
#
# Full description of class ius here.
#
#  Authors
#
# Danny Roberts <danny@thefallenphoenix.net>
#
#  Copyright
#
# Copyright 2015 Danny Roberts
#
class elrepo (

  $elrepo_baseurl            = $::elrepo::params::elrepo_baseurl,
  $elrepo_mirrorlist         = $::elrepo::params::elrepo_mirrorlist,
  $elrepo_proxy              = $::elrepo::params::elrepo_proxy,
  $elrepo_enabled            = $::elrepo::params::elrepo_enabled,
  $elrepo_gpgcheck           = $::elrepo::params::elrepo_gpgcheck,
  $elrepo_protect            = $::elrepo::params::elrepo_protect,

  $elrepo_testing_baseurl    = $::elrepo::params::elrepo_testing_baseurl,
  $elrepo_testing_mirrorlist = $::elrepo::params::elrepo_testing_mirrorlist,
  $elrepo_testing_proxy      = $::elrepo::params::elrepo_testing_proxy,
  $elrepo_testing_enabled    = $::elrepo::params::elrepo_testing_enabled,
  $elrepo_testing_gpgcheck   = $::elrepo::params::elrepo_testing_gpgcheck,
  $elrepo_testing_protect    = $::elrepo::params::elrepo_testing_protect,

  $elrepo_kernel_baseurl     = $::elrepo::params::elrepo_kernel_baseurl,
  $elrepo_kernel_mirrorlist  = $::elrepo::params::elrepo_kernel_mirrorlist,
  $elrepo_kernel_proxy       = $::elrepo::params::elrepo_kernel_proxy,
  $elrepo_kernel_enabled     = $::elrepo::params::elrepo_kernel_enabled,
  $elrepo_kernel_gpgcheck    = $::elrepo::params::elrepo_kernel_gpgcheck,
  $elrepo_kernel_protect     = $::elrepo::params::elrepo_kernel_protect,

  $elrepo_extras_baseurl     = $::elrepo::params::elrepo_extras_baseurl,
  $elrepo_extras_mirrorlist  = $::elrepo::params::elrepo_extras_mirrorlist,
  $elrepo_extras_proxy       = $::elrepo::params::elrepo_extras_proxy,
  $elrepo_extras_enabled     = $::elrepo::params::elrepo_extras_enabled,
  $elrepo_extras_gpgcheck    = $::elrepo::params::elrepo_extras_gpgcheck,
  $elrepo_extras_protect     = $::elrepo::params::elrepo_extras_protect,

) inherits elrepo::params {

  if $::osfamily == 'RedHat' and $::operatingsystem != 'Fedora' {
    
    yumrepo { 'elrepo':
      descr      => "ELRepo.org Community Enterprise Linux Repository - el${::operatingsystemmajrelease}",
      baseurl    => $elrepo_baseurl,
      mirrorlist => $elrepo_mirrorlist,
      proxy      => $elrepo_proxy,
      enabled    => $elrepo_enabled,
      gpgcheck   => $elrepo_gpgcheck,
      gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org',
      protect    => $elrepo_protect,
    }

    yumrepo { 'elrepo-testing':
      descr      => "ELRepo.org Community Enterprise Linux Testing Repository - el${::operatingsystemmajrelease}",
      baseurl    => $elrepo_testing_baseurl,
      mirrorlist => $elrepo_testing_mirrorlist,
      proxy      => $elrepo_testing_proxy,
      enabled    => $elrepo_testing_enabled,
      gpgcheck   => $elrepo_testing_gpgcheck,
      gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org',
      protect    => $elrepo_testing_protect,
    }

    yumrepo { 'elrepo-kernel':
      descr      => "ELRepo.org Community Enterprise Linux Kernel Repository - el${::operatingsystemmajrelease}",
      baseurl    => $elrepo_kernel_baseurl,
      mirrorlist => $elrepo_kernel_mirrorlist,
      proxy      => $elrepo_kernel_proxy,
      enabled    => $elrepo_kernel_enabled,
      gpgcheck   => $elrepo_kernel_gpgcheck,
      gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org',
      protect    => $elrepo_kernel_protect,
    }

    yumrepo { 'elrepo-extras':
      descr      => "ELRepo.org Community Enterprise Linux Extras Repository - el${::operatingsystemmajrelease}",
      baseurl    => $elrepo_extras_baseurl,
      mirrorlist => $elrepo_extras_mirrorlist,
      proxy      => $elrepo_extras_proxy,
      enabled    => $elrepo_extras_enabled,
      gpgcheck   => $elrepo_extras_gpgcheck,
      gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org',
      protect    => $elrepo_extras_protect,
    }

    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org':
      ensure => 'present',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/elrepo/RPM-GPG-KEY-elrepo.org',
    }

    elrepo::rpm_gpg_key{ 'RPM-GPG-KEY-elrepo.org':
      path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org',
      require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org'],
      before  => Yumrepo['elrepo', 'elrepo-testing', 'elrepo-kernel', 'elrepo-extras'],
    }
  } else {
    notice ("Your operating system ${::operatingsystem} will not have the ELRepo repository applied")
  }

}
