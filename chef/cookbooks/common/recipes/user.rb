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

key = node['user']['ssh_public_key']
if key.nil?
  if File.file?("/root/.ssh/authorized_keys")
    key = ::File.open("/root/.ssh/authorized_keys").read
  else
    raise "No public key was specified and /root/.ssh/authorized_keys does not exist"
  end
end

file "/home/#{username}/.ssh/authorized_keys" do
  owner username
  group username
  mode 0400
  content key
  action :create
end

sudo username do
  users username
end
