# frozen_string_literal: true

control 'deb-pkg-unautostart-policy-rc-d-01' do
  impact 1.0
  title 'policy-rc.d is managed to suppress service autostart'

  describe file('/usr/sbin/policy-rc.d') do
    it { should exist }
    it { should be_executable }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('mode') { should cmp '0755' }
    its('content') { should match(%r{#!/bin/sh\n# Managed by Chef Infra via deb_pkg_unautostart\nexit 101\n}) }
  end
end
