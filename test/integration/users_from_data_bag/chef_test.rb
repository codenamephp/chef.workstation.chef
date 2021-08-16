# frozen_string_literal: true

# InSpec test for recipe chef.workstation.chef::chef

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe bash('sudo -iHu user1 printenv') do
  its('stdout') { should match(%r{PATH=/opt/chef-workstation/}) }
end

describe bash('sudo -iHu user3 printenv') do
  its('stdout') { should match(%r{PATH=/opt/chef-workstation/}) }
end
