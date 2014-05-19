# install and setup hadoop
bash 'stop_hadoop_all' do
  user node['hadoop']['user']['name']
  code <<-EOH
    #{node['hadoop']['home']}/bin/stop-all.sh
  EOH

  only_if 'jps | grep JobTracker', user: node['hadoop']['user']['name']
end

tar_name = "hadoop-#{node['hadoop']['version']}"
remote_file "#{Chef::Config['file_cache_path']}/#{tar_name}.tar.gz" do
  source "http://archive.cloudera.com/cdh/3/#{tar_name}.tar.gz"
  checksum node['hadoop']['checksum']
  # notifies :run, 'bash[install_tmux]', :immediately
end

bash 'install_hadoop' do
  cwd Chef::Config['file_cache_path']
  code <<-EOH
    tar xzf #{tar_name}.tar.gz
    mv #{tar_name} #{node['hadoop']['home']}
  EOH
  not_if { ::File.exist?(node['hadoop']['home']) }
end

[node['hadoop']['tmp'],
 node['hadoop']['log_dir'],
 node['hadoop']['pids_dir']].each do |dir|
  directory dir do
    owner node['hadoop']['user']['name']
    group node['hadoop']['group']['name']
    mode '2750'
    recursive true
    action :create
  end
end

template "#{node['hadoop']['home']}/conf/hadoop-env.sh" do
  variables log_dir: node['hadoop']['log_dir'],
            pids_dir: node['hadoop']['pids_dir']
end

template "#{node['hadoop']['home']}/conf/core-site.xml" do
  fs_default_host = node['hadoop']['fs_default']['host']
  fs_default_host ||=
    node['network']['interfaces']['eth0']['addresses'].find do
      |_k, v| v[:family] == 'inet'
    end.first
  fs_default_port = node['hadoop']['fs_default']['port']

  variables tmp_dir: node['hadoop']['tmp'],
            fs_default: "hdfs://#{fs_default_host}:#{fs_default_port}"
end

template "#{node['hadoop']['home']}/conf/mapred-site.xml" do
  host = node['hadoop']['mapred_tracker']['host']
  host ||=
    node['network']['interfaces']['eth0']['addresses'].find do
      |_k, v| v[:family] == 'inet'
    end.first
  port = node['hadoop']['mapred_tracker']['port']

  variables mapred_tracker: "#{host}:#{port}"
end

template "#{node['hadoop']['home']}/conf/hdfs-site.xml" do
end

template "#{node['hadoop']['home']}/conf/log4j.properties" do
  variables log_dir: node['hadoop']['log_dir']
end

bash 'hdfs_init' do
  user node['hadoop']['user']['name']
  code <<-EOH
    #{node['hadoop']['home']}/bin/hadoop namenode -format
  EOH

  not_if { ::File.exist?(File.join(node['hadoop']['tmp'], 'dfs')) }
end

bash 'start_hadoop_all' do
  user node['hadoop']['user']['name']
  code <<-EOH
    #{node['hadoop']['home']}/bin/start-all.sh
  EOH
end
