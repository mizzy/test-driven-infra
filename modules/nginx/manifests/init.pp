class nginx {
  yumrepo { 'nginx':
    name     => 'nginx',
    baseurl  => 'http://nginx.org/packages/centos/$releasever/$basearch/',
    gpgcheck => 0,
    enabled  => 1,
  }

  package { 'nginx':
    ensure  => installed,
    require => Yumrepo['nginx'],
  }

  service { 'nginx':
    enable  => true,
    ensure  => running,
    require => Package['nginx'],
  }
}
