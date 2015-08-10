# == Class: lxc
#
# Installs and configures LXC.
#
# === Parameters
#
# Document parameters here.
#
# [*packages*]
#   LXC packages to be installed.
#
# === Authors
#
# Jeff Shantz <jeff@csd.uwo.ca>
#
# === Copyright
#
# Copyright 2015, Western University, unless otherwise noted.
#
class lxc (
  $packages           = $lxc::params::packages,
  $service            = $lxc::params::service,
  $config_dir         = $lxc::params::config_dir,
  $template_dir       = $lxc::params::template_dir,
)
inherits lxc::params {

  contain lxc::install
  contain lxc::patch
  contain lxc::service
  contain lxc::sysctl 

  Class["lxc::install"] ->
  Class["lxc::patch"] ->
  Class["lxc::service"] ->
  Class["lxc::sysctl"]

}
