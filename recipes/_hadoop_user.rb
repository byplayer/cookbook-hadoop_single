group node['hadoop']['group']['name'] do
  gid node['hadoop']['group']['gid']
  action :create
end

user node['hadoop']['user']['name'] do
  shell node['hadoop']['user']['shell']
  supports manage_home: true, non_unique: false
  gid node['hadoop']['group']['gid']
  uid node['hadoop']['user']['uid']
  action :create
end

directory "/home/#{node['hadoop']['user']['name']}" do
  owner node['hadoop']['user']['name']
  group node['hadoop']['group']['name']
  mode 00755
  action :create
end

# ssh keys
directory "/home/#{node['hadoop']['user']['name']}/.ssh" do
  owner node['hadoop']['user']['name']
  group node['hadoop']['group']['name']
  mode 0700
  action :create
end

file "/home/#{node['hadoop']['user']['name']}/.ssh/authorized_keys" do
  owner node['hadoop']['user']['name']
  mode 0600
  content node['hadoop']['user']['auth_key']
  action :create_if_missing
end

file "/home/#{node['hadoop']['user']['name']}/.ssh/id_rsa" do
  owner node['hadoop']['user']['name']
  mode 0600
  content node['hadoop']['user']['id_rsa']
  action :create_if_missing
end

file "/home/#{node['hadoop']['user']['name']}/.ssh/config" do
  owner node['hadoop']['user']['name']
  mode 0600
  content <<EOS
Host localhost
  StrictHostKeyChecking no
EOS
  action :create_if_missing
end
