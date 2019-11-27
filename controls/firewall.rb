control 'firewall-conf' do
  title 'Firewall setup'
  desc 'Firewall setup'

  case os[ :family]
    when 'debian'
      describe service 'ufw' do
        it { should be_enabled }
        it { should be_running }
      end
    when 'redhat'
      describe service 'firewalld' do
        it { should be_enabled }
        it { should be_running }
      end
  end
end
