#
# Cookbook Name:: auditd
# Recipe:: default
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

extend AuditD::Helper

package auditd_package_name_for(node['platform_family'])

service 'auditd' do
  supports [:start, :stop, :restart, :reload, :status]
  if node['platform_family'] == 'rhel' && node['platform_version'].to_f >= 7
    restart_command 'service auditd restart'
  end
  action :enable
end
