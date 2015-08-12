# == Class: lxc::install
#
# Installs the packages needed for LXC.
#
class lxc::install inherits lxc {

  if ($::osfamily == "RedHat") and ($::operatingsystem != "Amazon") and ($::operatingsystem != "Fedora") {
    include epel
    Class["epel"] -> Package[$lxc::packages]
  }

  package { $lxc::packages:
    ensure  => "present",
  }

}
