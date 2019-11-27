control 'chrony-conf' do
  title 'Chrony setup'
  desc 'Chrony setup'

  describe package('chrony') do
    it { should be_installed }
  end

  describe file('/etc/chrony.conf') do
    its('content') { should match /^server timeserver1 iburst/ }
    its('content') { should match /^server timeserver2 iburst/ }
    its('content') { should match /^server timeserver3 iburst/ }
    its('content') { should match /^server timeserver4 iburst/ }
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
end
