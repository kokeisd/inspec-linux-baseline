control 'qualys' do
  impact 'critical'
  title 'Qualys Cloud Agent is installed'
  desc 'Qualys Cloud Agent should be installed'
  
  if os.windows?
    package_name = 'Qualys Cloud Security Agent'
    package_version = '2.1.1.34'
  elsif os.linux?
    package_name = 'qualys-cloud-agent'
    pacakge_version = '2.1.0-91'
  end
  
  describe package("#{package_name}") do
    it {should be_installed}
    its ('version') {should cmp >= "#{package_version}"}
  end

end
