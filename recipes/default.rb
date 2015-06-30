#
# Cookbook Name:: slack
# Recipe:: default
#
# Copyright 2014, Risk I/O
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
chef_gem "slackr" do
  version '0.0.5'
  action :install
  # removing compile_time warnings in Chef 12 per:
  # http://jtimberman.housepub.org/blog/2015/03/20/chef-gem-compile-time-compatibility/
  compile_time true if Chef::Resource::ChefGem.instance_methods(false).include?(:compile_time)
end

begin
  if node["slack"]["should_require_slackr"]
    require 'slackr'
  end
rescue LoadError
  Chef::Log.fatal("Slackr gem load error.")
end
