control 'Qualys-conf' do
  title 'Qualys agent check'
  desc  'Qualys agent check'

  describe service('qualys-cloud-agent') do
    it { should be_enabled }
    it { should be_running }
  end
end
