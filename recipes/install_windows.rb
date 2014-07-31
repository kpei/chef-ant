#
# Author:: Doug MacEachern <dougm@vmware.com>
# Cookbook Name:: windows
# Recipe:: ant
#
# Copyright 2010, VMware, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

directory node[:ant][:home] do
  action :create
  recursive true
end

dir = "apache-ant-#{node[:ant][:version]}"
zip = "#{dir}-bin.zip"
home = "#{node[:ant][:home]}"

windows_zipfile home do
  overwrite true
  source "#{node[:ant][:url]}"
  action :unzip
  not_if { File.exists?("#{node[:ant][:home]}\\#{dir}\\bin\\ant.bat") }
end

env "ANT_HOME" do
  value "#{node[:ant][:home]}\\#{dir}"
end

env "PATH" do
  action :modify
  delim File::PATH_SEPARATOR
  value '%ANT_HOME%\bin'
end

