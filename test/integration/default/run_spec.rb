# Encoding: UTF-8
# AuditD - Smoke Test

# Service
describe service('auditd') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

# => Audit Rules File should Exist
describe file('/etc/audit/audit.rules') do
  it { should be_file }
end
