# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_chef
# Recipe:: vscode
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

codenamephp_dev_vscode 'Install VSCode'
codenamephp_dev_vscode_extensions 'Install VSCode extensions' do
  users_extensions Hash[node['users'].collect { |username| [username, node['codenamephp']['workstation_chef']['vscode']['extensions']] }]
end
