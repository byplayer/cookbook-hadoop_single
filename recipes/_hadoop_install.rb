# install and setup hadoop
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
  variables tmp_dir: node['hadoop']['tmp'],
            fs_default: node['hadoop']['fs_default']
end

template "#{node['hadoop']['home']}/conf/mapred-site.xml" do
  variables mapred_tracker: node['hadoop']['mapred_tracker']
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
