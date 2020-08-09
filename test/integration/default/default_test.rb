# frozen_string_literal: true

describe package('postfix') do
  it { should_not be_installed }
end
