#
# Cookbook:: common
# Spec:: user
require 'spec_helper'

describe 'common::user' do
  context 'With normal attributes on Ubuntu 18.04' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04') do |node|
        node.override['user']['name'] = 'testuser'
        node.override['user']['pw_hash'] = '$6$ffnS3Uow$d5hIhhdBq/F307.vpKzmZFGNZXGJQgRE0tBO3.0VP.tUrsui6WCQYO8tUlRYPGyjl0dSdUv5IFpfH3vPUEGsb0'
        node.override['user']['ssh_public_key'] = 'ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaUDT8naQHog1O+4sCZaK35bq2SI4WlyFPWaVTDeXXXST9blsptRn8IuZ0krMSXeONJJsbT4Ww= test@testhost'
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
