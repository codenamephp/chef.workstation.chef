# frozen_string_literal: true

# InSpec test for recipe chef.workstation.chef::docker

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe service('docker') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe command('docker compose version') do
  its('stdout') { should match(/Docker Compose version/) }
end

describe command("docker compose version | grep version | awk -F'[ ,]+' '{print $4}'") do
  its('stdout') { should cmp > '2.0.0' }
end