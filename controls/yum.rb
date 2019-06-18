describe file('/etc/yum.conf') do
  its('content') { should_not match /proxy/ }
end

