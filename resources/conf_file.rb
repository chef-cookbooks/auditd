
#
# Cookbook:: auditd
# Resource:: auditd_conf_file
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

action :create do
  extend AuditD::Helper

  template new_resource.name do
    source "cis.auditd.conf.erb"
    cookbook new_resource.cookbook if new_resource.cookbook
    owner 'root'
    group 'root'
    mode 0640
    notifies :reload, 'service[auditd]'
  end
end