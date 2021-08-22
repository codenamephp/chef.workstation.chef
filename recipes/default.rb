# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_chef
# Recipe:: default
#
# Copyright:: 2020, CodenamePHP
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

package 'postfix' do
  action :purge
end

include_recipe '::locale'
include_recipe '::timezone'
include_recipe '::keyboard_layout'
include_recipe '::docker'
include_recipe '::chef'
include_recipe '::vscode'
include_recipe '::edge'
include_recipe '::git'
