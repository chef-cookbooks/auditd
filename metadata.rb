# Encoding: utf-8
name 'auditd'
maintainer 'Heavy Water Operations, LLC.'
maintainer_email 'support@heavywater.io'
license 'Apache 2.0'
description 'Installs/Configures auditd'
source_url        "https://github.com/hw-cookbooks/auditd" if respond_to?(:source_url)
issues_url        "https://github.com/hw-cookbooks/auditd/issues" if respond_to?(:issues_url)
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.9'

%w(redhat ubuntu fedora).each do |os|
  supports os
end
