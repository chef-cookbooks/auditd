# Encoding: UTF-8
# AuditD CIS - Smoke Test

# Service
describe service('auditd') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

# => Audit Rules should have some Content
describe file('/etc/audit/audit.rules') do
  it { should be_file }
  # => This could probably be made better...
  its('content') { should match(%r{-a always,exit -F arch=b32 -S init_module -S delete_module -k modules}) }
end

# => Auditd conf should have some Content
describe file('/etc/audit/auditd.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its('mode') { should cmp '0640' }
  # => This could probably be made better...
  its('content') { should match(%r{\# This file is managed using Chef.}) }
end
