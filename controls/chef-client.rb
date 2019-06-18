describe package('chef') do
  it { should be_installed }
end


describe service('chef-client') do
  #it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

