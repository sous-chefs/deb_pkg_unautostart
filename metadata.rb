name 'deb_pkg_unautostart'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Stop deb packages from starting services'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.0'

supports 'ubuntu'
supports 'debian'

source_url 'https://github.com/chef-cookbooks/deb_pkg_unautostart'
issues_url 'https://github.com/chef-cookbooks/deb_pkg_unautostart/issues'

chef_version '>= 12.1'
