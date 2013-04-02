f = file '/usr/sbin/policy-rc.d' do
  mode 0755
  content("#!/bin/sh\nexit 101\n")
end

if(node[:deb_pkg_unautostart][:compiletime])
  f.run_action(:create)
end
