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

package "auditd" do
  package_name node['auditd']['package']
end

service "auditd" do
  supports [ :restart, :reload, :status ]
  action :enable
end

if node['platform'] == 'ubuntu'
  case node['auditd']['ruleset']
  when "capp"
    auditd_builtins "capp"
  when "lspp"
    auditd_builtins "lspp"
  when "nispom"
    auditd_builtins "nispom"
  when "stig"
    auditd_builtins "stig"
  else
    auditd_ruleset "default.rules"
  end
else 
  # RedHat uses version-specific paths for rule samples, we're only doing defaults for now
  auditd_ruleset "default.rules"
end
