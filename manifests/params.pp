# == Class: lxc::params
#
# Default parameter values for the lxc module.
#
class lxc::params {

  $config_dir   = "/usr/share/lxc/config"
  $template_dir = "/usr/share/lxc/templates"

  case $::osfamily {

    "redhat": {

      $packages = [
        "libvirt",
        "lxc",
        "lxc-templates",
        "rsync",
        "debootstrap"
      ]

      $service = "libvirtd"

    }

    default: {
      fail("This module currently does not support your operating system")
    }

  }

}
