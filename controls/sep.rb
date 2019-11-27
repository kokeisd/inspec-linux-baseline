control 'symantec' do
  impact 'high'
  title 'Symantec Endpoint Protection is installed'
  desc 'Symantec Endpoint Protection should be installed'
  describe service('symcfgd') do
    it { should be_enabled }
    it { should be_running }
  end
  
  describe service('rtvscand') do
    it { should be_enabled }
    it { should be_running }
  end
  
  describe service('smcd') do
    it { should be_enabled }
    it { should be_running }
  end
end




