# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_chef
# Spec:: vscode
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

describe 'codenamephp_workstation_chef::vscode' do
  context 'When all attributes are default' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'Adds apt repository' do
      expect(chef_run).to install_codenamephp_vscode_repository('Install apt repo')
    end

    it 'Installs VSCode' do
      expect(chef_run).to install_codenamephp_vscode_package('Install VSCode')
    end

    it 'Installs default extensions for user chef' do
      expect(chef_run).to install_codenamephp_vscode_extensions('Install VSCode extensions').with(
        users_extensions: {
          'chef' => ['chef-software.chef', 'eamodio.gitlens', 'github.vscode-pull-request-github', 'tabnine.tabnine-vscode'],
        }
      )
    end
  end

  context 'With custom users and extensions' do
    override_attributes['users'] = %w(user1 user2)
    override_attributes['codenamephp']['workstation_chef']['vscode']['extensions'] = %w(ext1 ext2)

    it 'Installs custom extensions for user user1 and user2' do
      expect(chef_run).to install_codenamephp_vscode_extensions('Install VSCode extensions').with(
        users_extensions: {
          'user1' => %w(ext1 ext2),
          'user2' => %w(ext1 ext2),
        }
      )
    end
  end
end
