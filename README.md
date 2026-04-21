# deb_pkg_unautostart cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/deb_pkg_unautostart.svg)](https://supermarket.chef.io/cookbooks/deb_pkg_unautostart)
[![CI State](https://github.com/sous-chefs/deb_pkg_unautostart/workflows/ci/badge.svg)](https://github.com/sous-chefs/deb_pkg_unautostart/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

Debian packages like to auto start processes during install, with default configurations, generally not even close to the desired configuration. This cookbook provides a custom resource that manages `/usr/sbin/policy-rc.d` so package installs can be staged without starting services prematurely.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit sous-chefs.org or come chat with us on the Chef Community Slack in #sous-chefs.

## Requirements

### Platforms

- Debian 12+
- Ubuntu 24.04+

### Chef

- Chef 15.3+

### Cookbooks

- None

## Usage

Declare `deb_pkg_unautostart_policy_rc_d` before the packages whose service autostart you want to suppress.

```ruby
deb_pkg_unautostart_policy_rc_d 'suppress package autostart'

package 'nginx'
```

When the package install happens during converge, declare the resource earlier in the run so `/usr/sbin/policy-rc.d` already exists before the package resource executes.

### Compile-time package installation

If another cookbook installs packages during compile time, create the policy script at compile time explicitly:

```ruby
deb_pkg_unautostart_policy_rc_d 'suppress package autostart' do
  compile_time true
end

package 'nginx'
```

This replaces the legacy `node['deb_pkg_unautostart']['compiletime']` attribute with an explicit resource declaration at the call site, which makes ordering and side effects visible in the recipe that needs them.

### Removing the managed policy

Remove the script after package installation when autostart suppression is no longer needed:

```ruby
deb_pkg_unautostart_policy_rc_d 'suppress package autostart' do
  action :delete
end
```

For safety, the delete action only removes files created by this resource unless you set `force_delete true`.

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
