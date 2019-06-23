describe command('kubelet') do
  it { should exist }
end

describe command('kubeadm') do
  it { should exist }
end

describe command('kubectl') do
  it { should exist }
end
