name 'master'
maintainer 'Sascha Eglau'
maintainer_email 'se@saschaeglau.com'
license 'MIT'
description 'Installs/Configures a master k8s node'
version '0.1.0'
chef_version '>= 12.14' if respond_to?(:chef_version)
depends 'common'
