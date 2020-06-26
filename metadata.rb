# frozen_string_literal: true

name 'codenamephp_workstation_chef'
maintainer 'Bastian Schwarz'
maintainer_email 'basitan@codename-php.de'
license 'Apache-2.0'
description 'Wrapper cookbook that sets up a chef workstation'
version '1.0.0'
chef_version '>= 13.0'
issues_url 'https://github.com/codenamephp/chef.cookbook.chef/issues'
source_url 'https://github.com/codenamephp/chef.cookbook.chef'

supports 'debian'

depends 'codenamephp_chef', '~> 2.1'
depends 'codenamephp_dev', '~> 2.4'
