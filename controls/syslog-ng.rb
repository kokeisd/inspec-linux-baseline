control 'syslog-ng-check' do
  title 'Syslog-ng check'
  desc 'Syslog-ng check'

  case os[:family]
    when 'debian'
      describe package('syslog-ng-core') do
        it { should be_installed }
      end
    when 'redhat'
      describe package('syslog-ng') do
        it { should be_installed }
      end
  end

  describe service('syslog-ng') do
  #it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end
