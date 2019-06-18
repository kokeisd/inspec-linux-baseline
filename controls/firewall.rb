case os[ :family]
  when 'debian'
    service 'ufw' do
      it { should_not be_enabled }
      it { should_not be_running }
    end
  when 'redhat'
    service 'firewalld' do
      it { should_not be_enabled }
      it { should_not be_running }
    end
end
