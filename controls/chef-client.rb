control 'chef-client-check' do
  title 'Chef client check'
  desc  'Chef client check'

  chef_client_version = '14.4.56'
  
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
