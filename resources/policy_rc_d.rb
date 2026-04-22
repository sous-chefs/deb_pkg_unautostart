# frozen_string_literal: true

unified_mode true

property :path, String, default: '/usr/sbin/policy-rc.d'
property :owner, String, default: 'root'
property :group, String, default: 'root'
property :mode, [String, Integer], default: '0755'
property :force_delete, [true, false], default: false, desired_state: false

default_action :create

action :create do
  file new_resource.path do
    owner new_resource.owner
    group new_resource.group
    mode new_resource.mode
    content policy_rc_d_content
  end
end

action :delete do
  if unmanaged_policy_rc_d?
    log "Skipping delete for unmanaged #{new_resource.path}; set force_delete true to override." do
      level :warn
    end
  else
    file new_resource.path do
      action :delete
    end
  end
end

action_class do
  def managed_marker
    '# Managed by Chef Infra via deb_pkg_unautostart'
  end

  def policy_rc_d_content
    <<~SCRIPT
      #!/bin/sh
      #{managed_marker}
      exit 101
    SCRIPT
  end

  def unmanaged_policy_rc_d?
    return false if new_resource.force_delete
    return false unless ::File.exist?(new_resource.path)

    !::File.read(new_resource.path).include?(managed_marker)
  end
end
