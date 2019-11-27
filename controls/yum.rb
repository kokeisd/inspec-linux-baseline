control 'yum-conf' do
  title 'Yum conf file'
  desc  'Yum config file'
  if os[:family] == 'redhat' or os[:family] == 'fedora'
    describe file('/etc/yum.conf') do
      its('content') { should_not match /proxy/ }
    end
  end
end
