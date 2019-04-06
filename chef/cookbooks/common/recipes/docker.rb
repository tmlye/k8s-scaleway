#
# Cookbook:: common
# Recipe:: docker
docker_installation_package 'default' do
  # Look up the version here: https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/
  version node['docker_version']
  action :create
  package_options %q|--force-yes -o Dpkg::Options::='--force-confold' -o Dpkg::Options::='--force-all'|
end
