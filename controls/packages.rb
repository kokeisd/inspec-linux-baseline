control 'Packages-setup' do
  title 'Packages-setup'
  desc 'Packages-setup'

  describe package('chrony') do
    it { should be_installed }
  end

  describe package('newrelic-infra') do
    it { should be_installed }
  end

  describe package('chef') do
    it { should be_installed }
  end

  describe package('telnet') do
    it { should be_installed }
  end


  case os[:family]
    when 'debian'
      describe package('vim') do
        it { should be_installed }
      end

      describe package('sysstat') do
        it { should be_installed }
      end
    when 'redhat'
      describe package('vim-enhanced') do
        it { should be_installed }
      end
  end
end
