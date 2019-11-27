control 'Qualys-conf' do
  title 'Qualys agent setup'
  desc  'Qualys agent setup'

  describe service('qualys-cloud-agent') do
    it { should be_enabled }
    it { should be_running }
  end
end
