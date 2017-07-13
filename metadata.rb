name 'auditd'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Installs/Configures auditd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.1.1'

%w(redhat ubuntu fedora centos scientific oracle).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/auditd'
issues_url 'https://github.com/chef-cookbooks/auditd/issues'
chef_version '>= 12.5' if respond_to?(:chef_version)
