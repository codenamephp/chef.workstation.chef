# Chef Workstation Chef
[![Build Status](https://travis-ci.com/codenamephp/chef.workstation.chef.svg?branch=master)](https://travis-ci.com/codenamephp/chef.workstation.chef)

This is a wrapper cookook that uses several codenamephp resources to setup a workstation for developing chef cookbook. This includes installing chef workstation,
setting up the bash environment to init chef, set a local dokken environment variable, etc. and installing VSCode with chef extensions.

## Requirements

### Supported Platforms

- Debian

### Chef

- Chef 13.0+

### Dependencies
- [codenamephp_chef][codenamephp_chef_url]
- [codenamephp_dev][codenamephp_dev_url]
## Usage

Add the cookbook to your Berksfile or metadata.rb:

```ruby
cookbook 'codenamephp_workstation_chef'
```

You can then add the cookbook to your runlist. The default recipe will setup everything EXCEPT the user(s). I recommend creating the users yourself using a databag
or just use the [user][user_cookbook_url]. This cookbook creates all users in `node['users']` from a databag. The attribute defaults to `chef`.

There is also the `codenamephp_workstation_chef::recipe` that does the bare minimum to create the users from `node['users']`. You can add this recipe before the
default recipe in your runlist.

## Attributes
- `default['users']`: The usernames that should be created and that receive the bash management and chef configs, defaults to `['chef']`
- `default['codenamephp']['workstation_chef']['vscode']['extensions']`: An array of extension names that will be installed for the users for vscode, defaults to `['chef-software.chef', 'eamodio.gitlens', 'github.vscode-pull-request-github']`
- `default['codenamephp']['workstation_chef']['locale']`: The locale that will be set as system language, defaults to `'de_DE.UTF-8'`
- `default['codenamephp']['workstation_chef']['timezone']`: The timezone that will be set as system timezone, defaults to `'Europe/Berlin'`

## Recipes
### Default
The default recipe sets everything up except the users by include the `system`, `chef` and `vscode` recipes. Make sure you have created the users beforehand.

### System
This recipe sets some system defaults like locale and timezone.

### Chef
The chef recipe installs the chef-workstation and sets up the environment by managing dropfiles for bash.

### VSCode
The vscode recipe installs [VSCode][vscode_url] and several extensions that are useful for developing cookbooks.

[user_cookbook_url]: https://supermarket.chef.io/cookbooks/user
[vscode_url]: https://code.visualstudio.com/
[codenamephp_chef_url]: https://supermarket.chef.io/cookbooks/codenamephp_chef
[codenamephp_dev_url]: https://supermarket.chef.io/cookbooks/codenamephp_dev