#
# Cookbook:: common
# Spec:: sshd
require 'spec_helper'

describe 'common::sshd' do
  context 'On Ubuntu 18.04' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
