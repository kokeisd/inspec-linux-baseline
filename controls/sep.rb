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
