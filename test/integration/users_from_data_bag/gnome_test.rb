# frozen_string_literal: true

# InSpec test for recipe chef.workstation.chef::gnome

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe command('sudo -u user1 gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings') do
  its('stdout.strip') { should eq "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']" }
end

describe command('sudo -u user1 gsettings get org.gnome.desktop.session idle-delay') do
  its('stdout.strip') { should eq 'uint32 0' }
end

describe command('sudo -u user1 gsettings list-recursively org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/') do
  its('stdout') { should match(Regexp.new("org.gnome.settings-daemon.plugins.media-keys.custom-keybinding binding '<Super><Alt>t'")) }
  its('stdout') { should match(Regexp.new("org.gnome.settings-daemon.plugins.media-keys.custom-keybinding command 'gnome-terminal --maximize'")) }
  its('stdout') { should match(Regexp.new("org.gnome.settings-daemon.plugins.media-keys.custom-keybinding name 'Terminal'")) }
end

describe command('sudo -u user3 gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings') do
  its('stdout.strip') { should eq "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']" }
end

describe command('sudo -u user3 gsettings get org.gnome.desktop.session idle-delay') do
  its('stdout.strip') { should eq 'uint32 0' }
end

describe command('sudo -u user3 gsettings list-recursively org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/') do
  its('stdout') { should match(Regexp.new("org.gnome.settings-daemon.plugins.media-keys.custom-keybinding binding '<Super><Alt>t'")) }
  its('stdout') { should match(Regexp.new("org.gnome.settings-daemon.plugins.media-keys.custom-keybinding command 'gnome-terminal --maximize'")) }
  its('stdout') { should match(Regexp.new("org.gnome.settings-daemon.plugins.media-keys.custom-keybinding name 'Terminal'")) }
end
