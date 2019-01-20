#
# Cookbook:: common
# Recipe:: docker
package 'apt-transport-https'
package 'ca-certificates'

execute 'add docker gpg key' do
  command 'curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -'
end
execute 'add docker repository' do
  command 'add-apt-repository "deb [arch=x86_64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && apt-get update'
end

docker_installation_package 'default' do
  # Look up the version here: https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/
  version node['docker_version']
  action :create
  package_options %q|--force-yes -o Dpkg::Options::='--force-confold' -o Dpkg::Options::='--force-all'|
end
