#
# Cookbook Name:: hadoop_single
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w(autoconf make g++).each do |pkg|
  apt_package pkg do
    action :install
  end
end

%w(java snappy).each do |cookbook|
  include_recipe cookbook
end

include_recipe 'hadoop_single::_hadoop_user'
include_recipe 'hadoop_single::_hadoop_install'
