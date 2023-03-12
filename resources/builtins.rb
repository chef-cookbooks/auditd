#
# Cookbook:: auditd
# Resource:: auditd_builtins
#
# Copyright:: 2012-2017, Heavy Water Operations, LLC.
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

property :cookbook, String

unified_mode true

action :create do
  extend AuditD::Helper

  if platform_family?('rhel', 'fedora')
    # auditd_version = `/sbin/aureport -v`.split(' ').last

    template auditd_rulefile do
      source "#{new_resource.name}.rules.erb"
      cookbook new_resource.cookbook if new_resource.cookbook
      notifies :restart, 'service[auditd]'
    end
  else
    execute "installing ruleset #{new_resource.name}" do
      command "zcat /usr/share/doc/auditd/examples/#{new_resource.name}.rules.gz > /etc/audit/audit.rules"
      notifies :restart, 'service[auditd]'
    end
  end
end
