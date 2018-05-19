#
# Cookbook:: common
# Recipe:: user
username = node['user']['name']

user username do
  home "/home/#{username}"
  shell '/bin/bash'
  password node['user']['pw_hash']
end

# Copy authorized_keys so we can log in
directory "/home/#{username}/.ssh" do
    mode '0700'
    owner username
    group username
    recursive true
end

file "/home/#{username}/.ssh/authorized_keys" do
  owner username
  group username
  mode 0400
  content ::File.open("/root/.ssh/authorized_keys").read
  action :create
end
