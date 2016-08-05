name 'deb_pkg_unautostart'
version '0.1.0'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Stop deb packages from starting services'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
supports 'ubuntu'
supports 'debian'

source_url 'https://github.com/chef-cookbooks/deb_pkg_unautostart' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/deb_pkg_unautostart/issues' if respond_to?(:issues_url)

chef_version '>= 11' if respond_to?(:chef_version)
