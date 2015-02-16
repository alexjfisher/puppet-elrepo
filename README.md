# elrepo

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with elrepo](#setup)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

##Overview

Module for managing the ELRepo repository.

From the ELRepo Project page [http://elrepo.org/tiki/tiki-index.php](http://elrepo.org/tiki/tiki-index.php):

ELRepo is a community repository for Enterprise Linux distributions (e.g, Red Hat Enterprise Linux (RHEL), CentOS, Scientific Linux).

ELRepo currently focuses on hardware related packages to boost your experience with Enterprise Linux. For example, this includes filesystem, graphics, hardware monitoring, network, sound and webcam drivers.

All our packages are built against the RHEL kernel and are compatible with other clone distributions who maintain compatibility with the RHEL kernel (e.g, CentOS, Scientific Linux). ELRepo packages are not compatible with clone distributions known to break kernel ABI compatibility (e.g, ClearOS).

##Module Description

This module sets up the ELRepo repo on EL systems.

##Setup

###What elrepo affects

* ELRepo repo files in '/etc/yum.repos.d'

###Beginning with elrepo

In a manifest:

```puppet
class { '::elrepo': }
```

In Hiera:

```yaml
---
classes:
  - elrepo
```

##Limitations

This module has been tested against the latest version of Puppet from the Puppetlabs repo for platforms it is tested on.

The module has been tested on:

* None currently.

This module should also work fine on:

* Red Hat Enterprise Linux 5/6/7
* CentOS 5/6/7
* Scientific Linux 5/6/7
* Oracle Linux 5/6/7

##Development

This module is open source under the **BSD 2-Clause** license and contributions to this module are welcome. Merge requests should be filed via GitHub.

Areas of particular interest that help would be appreciated in:

* Testing
* Adding missing functionality
* Filing bugfixes
* Documentation improvements

###Contributors

The list of contributors can be found at: [https://github.com/kemra102/puppet-elrepo/graphs/contributors](https://github.com/kemra102/puppet-elrepo/graphs/contributors)
