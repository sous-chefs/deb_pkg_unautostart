# frozen_string_literal: true

control 'deb-pkg-unautostart-policy-rc-d-02' do
  impact 1.0
  title 'policy-rc.d can be removed'

  describe file('/usr/sbin/policy-rc.d') do
    it { should_not exist }
  end
end
