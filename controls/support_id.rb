users = ['mlscom','cloudxadm1','cloudxadm2', 'xgamadm', 'xgamadm2','xgamadm3','etsasto1','etsasto2','etsamon1','etsamon2','cyberpmv','cyberlogon','cloudxpatch']
sudousers = ['cloudxadm1','cloudxadm2','etsasto1','etsasto2','etsamon1','etsamon2']

title 'Check the existence of support id'
#desc 'Check the existence of support id'
users.each do |u|
  describe user("#{u}") do
    it { should exist }
    its('shell') { should eq '/bin/bash' }
  end
end

describe user('mlscom') do 
  it { should exist }
  its('shell') { should eq '/bin/bash' }
  its('maxdays') { should eq 99999 }
end

sudousers.each do |u|
  describe file("/etc/sudoers.d/#{u}") do
    its('content') { should match /#{u} ALL=\(root\) ALL/ }
  end
end

describe file("/etc/sudoers.d/cloudxpatch") do
  its('content') { should match /cloudxpatch ALL=\(root\)/ }
end

describe file("/etc/sudoers.d/xgamadm") do
  its('content') { should match /xgamadm ALL=\(root\) GAM_COMMANDS/ }
  its('content') { should match /xgamadm2 ALL=\(root\) GAM_COMMANDS/ }
  its('content') { should match /xgamadm3 ALL=\(root\) GAM_COMMANDS/ }
end

describe file("/etc/sudoers.d/cyberpmv") do
  its('content') { should match /cyberpmv ALL=\(root\) NOPASSWD: \/usr\/bin\/passwd/ }
end

describe file("/etc/sudoers") do
  its('content') { should match /mlscom ALL=\(ALL\) NOPASSWD:ALL/ }
end

