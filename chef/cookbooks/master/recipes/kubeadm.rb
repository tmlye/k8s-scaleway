#
# Cookbook:: master
# Recipe:: kubeadm
apt_update
package 'apt-transport-https'

execute 'add google gpg key' do
  command 'curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -'
end

apt_repository 'kubernetes' do
  uri        'https://apt.kubernetes.io/'
  components ['main']
  distribution 'kubernetes-xenial'
end

package %w(kubelet kubeadm kubectl) do
  action :install
  notifies :lock, "package[kubelet, kubeadm, kubectl]"
end
