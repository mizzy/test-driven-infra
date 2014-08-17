class ntp {
  package { 'ntp': ensure => installed }

  service { 'ntpd':
    enable  => true,
    ensure  => running,
    require => Package['ntp'],
  }
}
