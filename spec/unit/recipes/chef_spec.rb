# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_chef
# Spec:: chef
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

require 'spec_helper'

describe 'codenamephp_workstation_chef::chef' do
  context 'When all attributes are default' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs chef-workstation using resource' do
      expect(chef_run).to install_codenamephp_chef_workstation('Install chef workstation')
    end

    it 'Installs chef einvornment using resource' do
      expect(chef_run).to install_codenamephp_chef_environment('Install chef environment for users').with(
        users: %w[chef]
      )
    end
  end

  context 'With custom users attribute' do
    override_attributes['users'] = %w[user1 user2]

    it 'Installs chef environment using resource for all users' do
      expect(chef_run).to install_codenamephp_chef_environment('Install chef environment for users').with(
        users: %w[user1 user2]
      )
    end
  end
end
