# Encoding: utf-8
# Cookbook Name:: auditd
# Provider:: auditd_builtins
#
# Copyright 2012, Heavy Water Operations, LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# provider for installing audit templates provided by auditd package

include Chef::Mixin::ShellOut

action :create do
  case node['platform_family']
  when 'gentoo'
    version = shell_out!('portageq best_version / sys-process/audit').stdout.chomp.sub('sys-process/audit-', '')
    data = shell_out!('bzcat', "/usr/share/doc/audit-#{version}/contrib/#{new_resource.name}.rules.bz2").stdout
  when 'rhel'
    version = shell_out!('/sbin/aureport -v').stdout.split.last
    data = ::File.read("/usr/share/doc/audit-#{version}/#{new_resource.name}.rules")
  when 'fedora'
    data = ::File.read("/usr/share/doc/audit/#{new_resource.name}.rules")
  when 'suse'
    data = ::File.read("/usr/share/doc/packages/audit/#{new_resource.name}.rules")
  when 'debian'
    require 'zlib'
    data = Zlib::GzipReader.open("/usr/share/doc/auditd/examples/#{new_resource.name}.rules.gz", &:read)
  when 'arch', 'slackware'
    fail NotImplementedError, node['platform'] + ' does not install the built in rules'
  else
    fail NotImplementedError, 'cannot find the built in rules on this platform'
  end

  f = file '/etc/audit/audit.rules' do
    content data
    notifies :run, 'execute[auditctl -R]', :immediately
  end

  new_resource.updated_by_last_action(f.updated_by_last_action?)
end
