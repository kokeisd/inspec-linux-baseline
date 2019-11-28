control 'Default-Support-ID-check' do
  title 'Default-Support-ID check'
  desc 'Default-Support-ID check'

  users = ['sysadmin1','sysadmin2','dbadmin1', 'dbadmin2', 'mwadmin1','mwadmin2','backupsvc']
  sudousers = ['sysadmin1','sysadmin2']  


  #title 'Check the existence of support id'
  #desc 'Check the existence of support id'
  users.each do |u|
    describe user("#{u}") do
      it { should exist }
      its('shell') { should eq '/bin/bash' }
    end
  end  

  describe user('backupsvc') do 
    it { should exist }
    its('shell') { should eq '/bin/bash' }
    its('maxdays') { should eq 99999 }
  end  

  sudousers.each do |u|
    describe file("/etc/sudoers.d/#{u}") do
      its('content') { should match /#{u} ALL=\(root\) ALL/ }
    end
  end  
end

