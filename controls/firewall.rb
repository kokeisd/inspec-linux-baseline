control 'Firewall-check' do
  title 'Firewall check'
  desc 'Firewall check'

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
