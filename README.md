# deb_pkg_unautostart cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/deb_pkg_unautostart.svg?branch=master)](http://travis-ci.org/chef-cookbooks/deb_pkg_unautostart) [![Cookbook Version](https://img.shields.io/cookbook/v/deb_pkg_unautostart.svg)](https://supermarket.chef.io/cookbooks/deb_pkg_unautostart)

Debian packages like to auto start processes during install, with default configurations, generally not even close to the desired configuration. That's annoying. Lets make it less annoying.

## Requirements

### Platforms

- Debian/Ubuntu

### Chef

- Chef 11+

### Cookbooks

- None

## Usage

Add to your run list, or include in a recipe, or how ever else you feel like getting a recipe compiled and converged:

```ruby
run_list("recipe[deb_pkg_unautostart]")
```

There's even an option to get this dropped during the compile phase in cases where you can't get to the start of the run list, or you have packages that are being installed during the compile phase.

```ruby
override_attributes(
  :deb_pkg_unautostart => {
    :compiletime => true
  }
)
```

## License & Authors

**Author:** Chris Roberts [chrisroberts.code@gmail.com](mailto:chrisroberts.code@gmail.com)

**Author:** Cookbook Engineering Team ([cookbooks@chef.io](mailto:cookbooks@chef.io))

**Copyright:** 2016, Chef Software, Inc.

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
