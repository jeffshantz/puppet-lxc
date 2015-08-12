class lxc::sysctl {

  sysctl { "net.ipv4.ip_forward":
    ensure  => "present",
    value   => "1",
    comment => "Required for LXC bridged networking",
  }

  sysctl {
    [ "net.bridge.bridge-nf-call-ip6tables",
      "net.bridge.bridge-nf-call-iptables",
      "net.bridge.bridge-nf-call-arptables",
      "net.bridge.bridge-nf-filter-vlan-tagged",
    ]:
    ensure  => "present",
    value   => "0",
    comment => "Disable netfilter on bridges for easier LXC support",
  }
    
}

