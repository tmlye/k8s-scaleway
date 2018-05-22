#
# Cookbook:: common
# Recipe:: docker
package 'apt-transport-https'
package 'ca-certificates'

execute 'add docker gpg key' do
  command 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -'
end
execute 'add docker repository' do
  command 'add-apt-repository "deb [arch=armhf] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && apt-get update'
end

docker_installation_package 'default' do
  # Look up the version here: https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/armhf/
  version node['docker_version']
  action :create
  package_options %q|--force-yes -o Dpkg::Options::='--force-confold' -o Dpkg::Options::='--force-all'|
end
