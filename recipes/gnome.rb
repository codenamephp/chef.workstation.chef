# frozen_string_literal: true

#
# Cookbook:: codenamephp_workstation_chef
# Recipe:: gnome
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

codenamephp_gui_gnome 'install gnome gui'

codenamephp_gui_gnome_gsettings 'Set display idle delay' do
  schema CodenamePHP::Gui::Helper::Gnome::GSettings::SCHEMA_DESKTOP_SESSION
  key CodenamePHP::Gui::Helper::Gnome::GSettings::KEY_DESKTOP_SESSION_IDLE_DELAY
  value '0'
  users node['users']
end

codenamephp_gui_gnome_keyboard_shortcut 'Terminal' do
  command 'gnome-terminal --maximize'
  binding "#{CodenamePHP::Gui::Helper::Gnome::GSettings::Keys::SUPER}#{CodenamePHP::Gui::Helper::Gnome::GSettings::Keys::ALT}t"
  users node['users']
end
