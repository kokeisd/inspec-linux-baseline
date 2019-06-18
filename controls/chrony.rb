describe package('chrony') do
  it { should be_installed }
end


describe file('/etc/chrony.conf') do
  its('content') { should match /^server 10.235.13.132 iburst/ }
  its('content') { should match /^server 10.235.129.132 iburst/ }
  its('content') { should match /^server 10.157.1.132 iburst/ }
  its('content') { should match /^server 10.159.5.132 iburst/ }
end

case os[:family]
  when 'debian'
    describe service('chrony') do
      #it { should be_installed }
      it { should be_enabled }
      it { should be_running }
   end
  when 'redhat'
    describe service('chronyd') do
      #it { should be_installed }
      it { should be_enabled }
      it { should be_running }
   end
end

