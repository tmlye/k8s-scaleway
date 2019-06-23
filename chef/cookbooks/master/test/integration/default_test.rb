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
