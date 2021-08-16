# frozen_string_literal: true

# InSpec test for recipe chef.workstation.chef::vscode

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe bash('sudo -iHu user1 code --list-extensions') do
  its('stdout') { should match(/chef-software.chef/) }
end

describe bash('sudo -iHu user3 code --list-extensions') do
  its('stdout') { should match(/chef-software.chef/) }
end
