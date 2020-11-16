my @hosts = [
  #%( host => "docker:alpine-rakuplay", tags => "alpine,os=alpine" ),
  %( host => "docker:debian-rakuplay", tags => "debian,os=debian" ),
  #%( host => "docker:centos-rakuplay", tags => "centos,os=centos" ),
  #%( host => "docker:ubuntu-rakuplay", tags => "ubuntu,os=ubuntu" ),
];

use Data::Dump;


say Dump(@hosts);

@hosts;
