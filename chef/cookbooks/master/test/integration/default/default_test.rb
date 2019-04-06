# Inspec test for recipe master::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe user('kuser') do
  it { should exist }
end

describe shadow.users('kuser') do
  its('count') { should eq 1 }
end

describe sshd_config do
  its('PermitRootLogin') { should eq('no') }
  its('PasswordAuthentication') { should eq('no') }
  its('PermitEmptyPasswords') { should eq('no') }
  its('ChallengeResponseAuthentication') { should eq('no') }

  its('RSAAuthentication') { should eq('yes') }
  its('PubkeyAuthentication') { should eq('yes') }
end

describe command('docker') do
  it { should exist }
end

describe docker.version do
  its('Server.Version') { should cmp >= '18.06'}
  its('Client.Version') { should cmp >= '18.06'}
end

describe command('kubelet') do
  it { should exist }
end

describe command('kubeadm') do
  it { should exist }
end

describe command('kubectl') do
  it { should exist }
end
