# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_chef
# Spec:: users
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

describe 'codenamephp_workstation_chef::users' do
  context 'When all attributes are default' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates teh chef group' do
      expect(chef_run).to create_group('chef')
    end

    it 'creates the chef user' do
      expect(chef_run).to create_user('chef').with(
        group: 'chef',
        manage_home: true
      )
    end

    it 'copies the ssh key' do
      expect(chef_run).to install_codenamephp_ssh_keys_local_copy('Copy ssh keys for chef').with(
        user: 'chef',
        private_key_source: '/var/workspace/id_rsa'
      )
    end
  end

  context 'With custom users attributes' do
    override_attributes['users'] = %w(user1 user2)
    override_attributes['codenamephp']['workstation_chef']['ssh_keys']['local_copy']['user1']['private_key_source'] = '/some/private/key'

    it 'Creates all users' do
      expect(chef_run).to create_user('user1').with(
        group: 'chef',
        manage_home: true
      )

      expect(chef_run).to create_user('user2').with(
        group: 'chef',
        manage_home: true
      )
    end

    it 'copies the ssh key for user1 and not user2' do
      expect(chef_run).to install_codenamephp_ssh_keys_local_copy('Copy ssh keys for user1').with(
        user: 'user1',
        private_key_source: '/some/private/key'
      )

      expect(chef_run).to_not install_codenamephp_ssh_keys_local_copy('Copy ssh keys for user2')
    end
  end
end
