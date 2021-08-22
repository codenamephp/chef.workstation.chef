include_recipe '::git'

codenamephp_users_from_data_bag 'Create users' do
  data_bag_name node['codenamephp']['workstation_chef']['users_from_data_bag']['data_bag_name']
  groups node['codenamephp']['workstation_chef']['users_from_data_bag']['groups']
end

codenamephp_git_client_config_users_from_data_bag 'Manage git users'
