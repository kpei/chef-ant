name             "ant"
maintainer       "Opscode, Inc."
maintainer_email "cookbooks@opscode.com"
license          "Apache 2.0"
description      "Installs/Configures ant. Changed by Kevin to support Windows"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.3"
%w{ debian ubuntu centos redhat fedora windows }.each do |os|
  supports os
end

recipe "ant::default", "Installs and configures Ant"

depends "java"
depends "ark"
depends "windows"
