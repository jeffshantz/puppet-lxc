# == Class: lxc::patch 
#
# Patches various files needed to ensure that LXC works correctly on a 
# CentOS 7.1 host.  
#
# TODO: Re-evaluate the need for this class when CentOS 7.2 is released.
#
class lxc::patch inherits lxc {

  package { "patch":
    ensure => "present",
  }

  ##############################################################################
  # Provide a more up-to-date CentOS template than what is provided in the     #
  # lxc-templates package.                                                     #
  ##############################################################################

  $centos_template = "${lxc::template_dir}/lxc-centos"
  $centos_patch = "/tmp/lxc-centos.patch"

  file { $centos_patch:
    owner   => "root",
    group   => "root",
    mode    => "0600",
    source  => "puppet:///modules/lxc/lxc-centos.patch",
    notify  => Exec["apply-lxc-centos-patch"],
    require => Package["patch"],
  }

  exec { "apply-lxc-centos-patch":
    path        => ["/usr/bin"],
    command     => "patch -p1 ${centos_template} < ${centos_patch}",
    refreshonly => true,
    unless      => "grep root_expire_password ${centos_template}",
  }

  ##############################################################################
  # Patch the lxc-ubuntu template to allow it to quickly snapshot its btrfs    #
  # subvolume when creating a new container, rather than copying the entire    #
  # rootfs.                                                                    #
  ##############################################################################

  $ubuntu_template = "${lxc::template_dir}/lxc-ubuntu"
  $ubuntu_patch = "/tmp/lxc-ubuntu.patch"

  file { $ubuntu_patch:
    owner   => "root",
    group   => "root",
    mode    => "0600",
    source  => "puppet:///modules/lxc/lxc-ubuntu.patch",
    notify  => Exec["apply-lxc-ubuntu-patch"],
    require => Package["patch"],
  }

  exec { "apply-lxc-ubuntu-patch":
    path        => ["/usr/bin"],
    command     => "patch -p1 ${ubuntu_template} < ${ubuntu_patch}",
    refreshonly => true,
    unless      => "grep btrfs ${ubuntu_template}",
  }

  ############################################################################## 
  # Comment out a line in the fedora.common.conf configuration file that       #
  # prevents CentOS/Fedora containers from installing packages like httpd.     #
  ############################################################################## 

  $fedora_config = "${lxc::config_dir}/fedora.common.conf"

  exec { "comment-out-fedora-setfcap-drop":
    path => ["/usr/bin"],
    command => "sed -i 's/lxc.cap.drop = setfcap/#lxc.cap.drop = setfcap/g' ${fedora_config}",
  }

}
