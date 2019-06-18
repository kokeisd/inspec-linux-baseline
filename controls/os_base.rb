case os[:family]
  when 'debian'

    describe service('ufw') do
      it { should_not be_enabled }
      it { should_not be_running }
    end

  when 'redhat'

    describe service('firewalld') do
      it { should_not be_enabled }
      it { should_not be_running }
    end

    describe.one do
      describe file('/etc/selinux/config') do
        its('content') { should match /^SELINUX=disabled/ }
      end
  
      describe file('/etc/selinux/config') do
        its('content') { should match /^SELINUX=permissive/ }
      end
   end
end
