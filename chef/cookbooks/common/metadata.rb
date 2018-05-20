name 'common'
maintainer 'Sascha Eglau'
maintainer_email 'se@saschaeglau.com'
license 'MIT'
description 'Sets up the OS and installs common packages'
version '0.1.0'
chef_version '>= 12.14' if respond_to?(:chef_version)

depends 'sudo'
depends 'docker'
