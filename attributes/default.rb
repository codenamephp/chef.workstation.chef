# frozen_string_literal: true

default['users'] = ['chef']
default['codenamephp']['workstation_chef']['vscode']['extensions'] = ['chef-software.chef', 'eamodio.gitlens', 'github.vscode-pull-request-github']
default['codenamephp']['workstation_chef']['timezone'] = 'Europe/Berlin'
default['codenamephp']['workstation_chef']['locale'] = 'de_DE.UTF-8'
default['codenamephp']['workstation_chef']['users_from_data_bag']['data_bag_name'] = 'users'
default['codenamephp']['workstation_chef']['users_from_data_bag']['groups'] = %w(chef docker sudo sysadmin)
