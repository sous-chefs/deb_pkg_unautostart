describe file('/usr/sbin/policy-rc.d') do
  it { should exist }
  its('content') { should cmp "#!/bin/sh\nexit 101\n" }
end
