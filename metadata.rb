name 'auditd'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Installs/Configures auditd'
version '2.4.0'

%w(redhat ubuntu fedora centos scientific oracle).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/auditd'
issues_url 'https://github.com/chef-cookbooks/auditd/issues'
chef_version '>= 12.15'
