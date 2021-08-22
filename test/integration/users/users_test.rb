# frozen_string_literal: true

# InSpec test for recipe codenamephp_workstation_chef::users

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe user('chef') do
  it { should exist }
  its('group') { should eq 'chef' }
  its('home') { should eq '/home/chef' }
end

describe file('/home/chef/.ssh/id_rsa') do
  it { should exist }
  it { should be_file }
  its('content') { should eq 'my private key' }
  its('group') { should eq 'chef' }
  its('owner') { should eq 'chef' }
  its('mode') { should cmp '0600' }
end

describe file('/home/chef/.ssh/id_rsa.pub') do
  it { should exist }
  it { should be_file }
  its('content') { should eq 'my public key' }
  its('group') { should eq 'chef' }
  its('owner') { should eq 'chef' }
  its('mode') { should cmp '0640' }
end

describe command('sudo -u chef git config --global user.name') do
  its('stdout.strip') { should eq('I am Chef') }
end

describe command('sudo -u chef git config --global user.email') do
  its('stdout.strip') { should eq('chef@test.de') }
end
