name             'slack'
maintainer       'Ian Henry'
maintainer_email 'ihenry@chef.io'
license          'Apache 2.0'
description      'slack LWRP for notifying slack.com channels'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{redhat centos scientific fedora debian ubuntu arch freebsd amazon}.each do |os|
  supports os
end
