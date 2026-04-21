# frozen_string_literal: true

require 'spec_helper'

describe 'deb_pkg_unautostart_policy_rc_d' do
  step_into :deb_pkg_unautostart_policy_rc_d
  platform 'ubuntu', '24.04'

  context 'with default properties' do
    recipe do
      deb_pkg_unautostart_policy_rc_d 'suppress package autostart'
    end

    it { is_expected.to create_file('/usr/sbin/policy-rc.d').with(owner: 'root', group: 'root', mode: '0755') }
    it { is_expected.to render_file('/usr/sbin/policy-rc.d').with_content("#!/bin/sh\n# Managed by Chef Infra via deb_pkg_unautostart\nexit 101\n") }
  end

  context 'with a custom path' do
    recipe do
      deb_pkg_unautostart_policy_rc_d 'custom policy path' do
        path '/tmp/policy-rc.d'
      end
    end

    it { is_expected.to create_file('/tmp/policy-rc.d') }
  end

  context 'when deleting a managed file' do
    before do
      allow(::File).to receive(:exist?).and_call_original
      allow(::File).to receive(:read).and_call_original
      allow(::File).to receive(:exist?).with('/usr/sbin/policy-rc.d').and_return(true)
      allow(::File).to receive(:read).with('/usr/sbin/policy-rc.d').and_return("#!/bin/sh\n# Managed by Chef Infra via deb_pkg_unautostart\nexit 101\n")
    end

    recipe do
      deb_pkg_unautostart_policy_rc_d 'remove managed policy' do
        action :delete
      end
    end

    it { is_expected.to delete_file('/usr/sbin/policy-rc.d') }
  end

  context 'when deleting an unmanaged file without force_delete' do
    before do
      allow(::File).to receive(:exist?).and_call_original
      allow(::File).to receive(:read).and_call_original
      allow(::File).to receive(:exist?).with('/usr/sbin/policy-rc.d').and_return(true)
      allow(::File).to receive(:read).with('/usr/sbin/policy-rc.d').and_return("#!/bin/sh\nexit 101\n")
    end

    recipe do
      deb_pkg_unautostart_policy_rc_d 'skip unmanaged delete' do
        action :delete
      end
    end

    it { is_expected.not_to delete_file('/usr/sbin/policy-rc.d') }
  end

  context 'when force deleting an unmanaged file' do
    before do
      allow(::File).to receive(:exist?).and_call_original
      allow(::File).to receive(:read).and_call_original
      allow(::File).to receive(:exist?).with('/usr/sbin/policy-rc.d').and_return(true)
      allow(::File).to receive(:read).with('/usr/sbin/policy-rc.d').and_return("#!/bin/sh\nexit 101\n")
    end

    recipe do
      deb_pkg_unautostart_policy_rc_d 'force unmanaged delete' do
        force_delete true
        action :delete
      end
    end

    it { is_expected.to delete_file('/usr/sbin/policy-rc.d') }
  end
end
