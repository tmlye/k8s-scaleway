#
# Cookbook:: common
# Recipe:: docker
docker_installation_package 'default' do
  # Look up the version here: https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/arm64/
  version node['docker_version']
  action :create
  package_options %q|--force-yes -o Dpkg::Options::='--force-confold' -o Dpkg::Options::='--force-all'|
end
