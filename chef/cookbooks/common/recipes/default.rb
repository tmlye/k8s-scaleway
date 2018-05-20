#
# Cookbook:: common
# Recipe:: default
include_recipe "common::sshd"
include_recipe "common::user"
include_recipe "common::docker"
