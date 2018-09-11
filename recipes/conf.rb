#
# Cookbook:: auditd
# Recipe:: default

include_recipe 'auditd::default'

# Case used to give extensibility for the future
case node['auditd']['ruleset']
when 'cis'
    auditd_conf_file 'cis.auditd'
end