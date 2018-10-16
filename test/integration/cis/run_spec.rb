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
  its('content') { should match(/-a always,exit -F arch=b32 -S init_module -S delete_module -k modules/) }
end

# => Audit Rules should have some Content
OS = os[:release].to_i
describe file('/etc/audit/audit.rules') do
  if OS == 6
    its('content') { should match(%r{-w /var/log/btmp -p wa -k session}) }
  elsif OS == 7
    its('content') { should match(%r{-w /var/log/btmp -p wa -k logins}) }
  end
end

# => Auditd conf should have some Content
describe file('/etc/audit/auditd.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its('mode') { should cmp '0640' }
  its('content') { should match(/\# This file is managed using Chef./) }
end
