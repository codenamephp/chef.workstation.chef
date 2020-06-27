# frozen_string_literal: true

# InSpec test for recipe chef.workstation.chef::system

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe command('timedatectl') do
  its('stdout') { should match %r{Time zone: Europe/Berlin} }
end

describe command('cat /etc/locale.conf') do
  its('stdout') { should match(/LANG=de_DE.UTF-8/) }
end
