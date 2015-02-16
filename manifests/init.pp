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

  $elrepo_baseurl    = $::elrepo::params::elrepo_baseurl,
  $elrepo_mirrorlist = $::elrepo::params::elrepo_mirrorlist,
  $elrepo_proxy      = $::elrepo::params::elrepo_proxy,
  $elrepo_enabled    = $::elrepo::params::elrepo_enabled,
  $elrepo_gpgcheck   = $::elrepo::params::elrepo_gpgcheck,
  $elrepo_gpgcheck   = $::elrepo::params::elrepo_protect,

) inherits elrepo::params {

  if ${::osfamily} == 'RedHat' and ${::operatingsystem} != 'Fedora' {
    
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

    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org':
      ensure => 'present',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/elrepo/RPM-GPG-KEY-elrepo.org',
    }

    ius::rpm_gpg_key{ 'RPM-GPG-KEY-elrepo.org':
      path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org',
      require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org'],
      before  => Yumrepo['elrepo'],
    }
  } else {
    notice ("Your operating system ${::operatingsystem} will not have the ELRepo repository applied")
  }

}
