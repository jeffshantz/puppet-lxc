# == Class: lxc::install
#
# Installs the packages needed for LXC.
#
class lxc::install inherits lxc {

  package { "epel-release":
    ensure => "present",
    before => Package[$lxc::packages],
  }

  package { $lxc::packages:
    ensure => "present",
  }

}
