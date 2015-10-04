class lxc::functions {

  file { "/etc/profile.d/lxc.sh":
    ensure => "present",
    owner  => "root",
    group  => "root",
    mode   => "0644",
    source => "puppet:///modules/lxc/lxc.sh",
  }

}

