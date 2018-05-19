#
# Cookbook:: common
# Recipe:: sshd
cookbook_file '/etc/ssh/sshd_config' do
  source 'sshd_config'
  owner 'root'
  group 'root'
  mode '0600'
end

service 'sshd' do
  action :reload
end
