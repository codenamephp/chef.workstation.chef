# frozen_string_literal: true

# InSpec test for recipe chef.workstation.chef::chef

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe command('chef -v') do
  its('stdout') { should match(/Chef Workstation version:/) }
end
