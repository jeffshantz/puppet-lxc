# == Class: lxc::service 
#
# Starts and enables the service(s) needed to run LXC containers.
#
class lxc::service inherits lxc {

  service { $lxc::service:
    ensure => "running",
    enable => true
  }

}
