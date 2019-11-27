control 'chef-client' do
  impact 'medium'
  title 'Chef Client is installed'
  desc 'Chef Client should be installed'
  
  chef_client_version = '14.7.17'
  
  describe command ('chef-client -v') do
    its ('stdout') { should match "#{chef_client_version}" }
  end

  describe package('chef') do
    it { should be_installed }
  end
  
  
  describe service('chef-client') do
    it { should be_enabled }
    it { should be_running }
  end
end
