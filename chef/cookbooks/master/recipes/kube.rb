#
# Cookbook:: master
# Recipe:: kube

# TODO: use kubeadm instead to set up the cluster
etcd_service 'default' do
  advertise_client_urls 'http://127.0.0.1:2379'
  listen_client_urls 'http://127.0.0.1:2379'
  action %w(create start)
end

kube_apiserver 'default' do
  service_cluster_ip_range '10.0.0.0/24'
  etcd_servers 'http://127.0.0.1:2379'
  insecure_bind_address '0.0.0.0' # for convenience
  action %w(create start)
end

kube_scheduler 'default' do
  master '127.0.0.1:8080'
  action %w(create start)
end

kube_controller_manager 'default' do
  master '127.0.0.1:8080'
  action %w(create start)
end
