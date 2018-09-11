#
# Cookbook:: auditd
# Resource:: auditd_conf_file
#
property :cookbook, String

action :create do
  extend AuditD::Helper

  template auditd_conffile(new_resource.name) do
    source "#{new_resource.name}.conf.erb"
    cookbook new_resource.cookbook if new_resource.cookbook
    notifies :reload, 'service[auditd]'
  end
end
