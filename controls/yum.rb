control 'yum-check' do
  title 'Yum config check'
  desc  'Yum config fcheckile'
  if os[:family] == 'redhat' or os[:family] == 'fedora'
    describe file('/etc/yum.conf') do
      its('content') { should_not match /proxy/ }
    end
  end
end
