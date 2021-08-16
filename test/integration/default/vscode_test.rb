# frozen_string_literal: true

# InSpec test for recipe chef.workstation.chef::vscode

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe package('code') do
  it { should be_installed }
end
