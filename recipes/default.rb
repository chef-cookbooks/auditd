#
# Cookbook:: auditd
# Recipe:: default
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

extend AuditD::Helper

package auditd_package_name_for(node['platform_family'])

# There is a specific issue with RHEL7 (https://bugzilla.redhat.com/show_bug.cgi?id=1647521) where
# auditd fails to stop/start/restart/reload using systemctl. This logic will set the correct reload
# and restart actions for this recipe when it detects you are using RHEL7.x
service 'auditd' do
  if platform_family?('rhel') && node['init_package'] == 'systemd' && node['platform_version'] < '7.5'
    reload_command '/usr/libexec/initscripts/legacy-actions/auditd/reload'
    restart_command '/usr/libexec/initscripts/legacy-actions/auditd/restart'
  end
  if platform_family?('rhel') && node['init_package'] == 'systemd' && node['platform_version'] >= '7.5'
    reload_command '/usr/sbin/service auditd reload'
    restart_command '/usr/sbin/service auditd restart'
  end
  supports [:start, :stop, :restart, :reload, :status]
  action :enable
end
