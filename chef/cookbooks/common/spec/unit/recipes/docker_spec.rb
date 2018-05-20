#
# Cookbook:: common
# Spec:: docker
require 'spec_helper'

describe 'common::docker' do
  context 'On Ubuntu 16.04' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04') do |node|
        node.override['docker_version'] = '18.03.1'
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
