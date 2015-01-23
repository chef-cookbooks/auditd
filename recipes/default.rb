# Encoding: utf-8
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

case node['platform_family']
when 'debian'
  package 'auditd'
else
  package 'audit'
end

service 'auditd' do
  supports [:reload, :status]
  action [:enable, :start]
end

execute 'auditctl -R' do
  command 'auditctl -R /etc/audit/audit.rules'
  action :nothing
end
