# lxc

#### Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options and additional functionality](#usage)
3. [Limitations - OS compatibility, etc.](#limitations)

## Overview

Installs and configures LXC.

## Usage

Simply include the lxc module:

```puppet
include lxc
```

To override the package defaults:

```puppet
class { 'lxc':
  config_dir   => '/usr/share/lxc/config',
  packages     => ['libvirt', 'lxc', 'lxc-templates', 'rsync', 'debootstrap'],
  service      => 'libvirtd',
  template_dir => '/usr/share/lxc/templates',
}
```

## Limitations

Currently, this module supports only CentOS 7.x.
