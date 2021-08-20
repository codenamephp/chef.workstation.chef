# frozen_string_literal: true

name 'codenamephp_workstation_chef'
maintainer 'Bastian Schwarz'
maintainer_email 'basitan@codename-php.de'
license 'Apache-2.0'
description 'Wrapper cookbook that sets up a chef workstation'
version '1.8.0'
chef_version '>= 15.3'
issues_url 'https://github.com/codenamephp/chef.cookbook.chef/issues'
source_url 'https://github.com/codenamephp/chef.cookbook.chef'

supports 'debian'

depends 'codenamephp_chef', '~> 3.0'
depends 'codenamephp_docker', '~> 3.0'
depends 'codenamephp_edge', '~> 1.0'
depends 'codenamephp_gnome', '~> 1.0'
depends 'codenamephp_keyboard_layout', '~> 1.0'
depends 'codenamephp_ssh_keys', '~> 1.0'
depends 'codenamephp_users', '~> 1.0'
depends 'codenamephp_vscode', '~> 1.0'
