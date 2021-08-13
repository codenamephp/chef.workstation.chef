# frozen_string_literal: true

#
# Cookbook:: chef.workstation.chef
# Recipe:: chef
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

codenamephp_chef_repository 'Add chef repository'
codenamephp_chef_workstation 'Install chef workstation'
codenamephp_chef_environment 'Install chef environment for users' do
  users node['users']
end
