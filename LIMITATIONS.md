# LIMITATIONS

## Platform Support

This cookbook manages `/usr/sbin/policy-rc.d`, which is part of the Debian-family
service policy mechanism used by `invoke-rc.d` during package installation.

Supported platforms:

- Debian 12+
- Ubuntu 24.04+

## Package Manager Scope

This cookbook is only useful for packages installed through Debian packaging tools
that honor `invoke-rc.d` and `/usr/sbin/policy-rc.d`.

- `apt`
- `dpkg`

It does not manage service start behavior for RPM-based systems or packages that do
not consult `invoke-rc.d`.

## Behavioral Constraints

- The resource suppresses package autostart by installing an executable
  `/usr/sbin/policy-rc.d` script that exits `101`.
- If the script must exist before compile-time package installation, callers should
  declare the resource with `compile_time true`.
- The delete action removes only scripts created by this cookbook unless
  `force_delete true` is set.
