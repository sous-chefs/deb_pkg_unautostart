# deb_pkg_unautostart_policy_rc_d

Manages the `/usr/sbin/policy-rc.d` script used to suppress Debian package
autostart during installation.

## Actions

| Action    | Description                                                   |
|-----------|---------------------------------------------------------------|
| `:create` | Creates the managed `policy-rc.d` script that exits `101`.    |
| `:delete` | Removes the managed script.                                   |

## Properties

| Property       | Type               | Default                  | Description                                                      |
|----------------|--------------------|--------------------------|------------------------------------------------------------------|
| `path`         | String             | `'/usr/sbin/policy-rc.d'`| Location of the policy script.                                   |
| `owner`        | String             | `'root'`                 | Owner of the managed file.                                       |
| `group`        | String             | `'root'`                 | Group of the managed file.                                       |
| `mode`         | String, Integer    | `'0755'`                 | Mode applied to the managed file.                                |
| `force_delete` | true, false        | `false`                  | Remove the file even when it does not contain the managed marker.|
| `compile_time` | true, false        | `false`                  | Common Chef resource property for creating the script at compile time. |

## Examples

### Suppress package autostart during converge

```ruby
deb_pkg_unautostart_policy_rc_d 'suppress package autostart'
```

### Ensure the policy exists before compile-time package installation

```ruby
deb_pkg_unautostart_policy_rc_d 'suppress package autostart' do
  compile_time true
end

package 'nginx'
```

### Remove the managed policy after package installation

```ruby
deb_pkg_unautostart_policy_rc_d 'suppress package autostart' do
  action :delete
end
```

### Force removal of an unmanaged script

```ruby
deb_pkg_unautostart_policy_rc_d 'remove custom policy' do
  force_delete true
  action :delete
end
```
