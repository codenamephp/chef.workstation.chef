# frozen_string_literal: true

# InSpec test for recipe codenamephp_workstation_chef::users

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe user('chef') do
  it { should exist }
  its('group') { should eq 'chef' }
  its('home') { should eq '/home/chef' }
end
