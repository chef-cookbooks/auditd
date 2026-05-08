#
# Cookbook:: auditd
# Recipe:: default

include_recipe 'auditd::default'

# Case used to give extensibility for the future
case node['auditd']['ruleset']
when 'cis'
  auditd_conf_file 'cis.auditd'
end

template '/etc/audisp/plugins.d/syslog.conf' do
  source 'audisp_syslog.conf.erb'
  owner 'root'
  group 'root'
  mode '0640'
  variables(
    active: node['auditd']['syslog']
  )
  notifies :reload, 'service[auditd]', :delayed
end
