# Encoding: UTF-8
# AuditD STIG - Smoke Test

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
  its('content') { should match(%r{/etc/sudoers -p wa -k actions}) }
end
