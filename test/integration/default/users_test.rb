# frozen_string_literal: true

# InSpec test for recipe codenamephp_workstation_chef::users

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe user('chef') do
  it { should exist }
  its('group') { should eq 'chef' }
  its('home') { should eq '/home/chef' }
end

describe user('user1') do
  it { should exist }
  its('groups') { should include 'chef' }
  its('groups') { should include 'docker' }
  its('groups') { should include 'sudo' }
  its('groups') { should include 'sysadmin' }
end

describe user('user2') do
  it { should_not exist }
end

describe user('user3') do
  it { should exist }
  its('groups') { should include 'chef' }
end
