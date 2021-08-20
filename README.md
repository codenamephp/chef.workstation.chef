# Chef Workstation Chef
[![CI](https://github.com/codenamephp/chef.workstation.chef/actions/workflows/ci.yml/badge.svg)](https://github.com/codenamephp/chef.workstation.chef/actions/workflows/ci.yml)

This is a wrapper cookook that uses several codenamephp resources to setup a workstation for developing chef cookbook. This includes installing chef workstation,
setting up the bash environment to init chef, set a local dokken environment variable, etc. and installing VSCode with chef extensions.

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
- `default['codenamephp']['workstation_chef']['vscode']['extensions']`: An array of extension names that will be installed for the users for vscode, defaults to `['chef-software.chef', 'eamodio.gitlens', 'github.vscode-pull-request-github']`
- `default['codenamephp']['workstation_chef']['timezone']`: The timezone to set, defaults to 'Europe/Berlin'
- `default['codenamephp']['workstation_chef']['locale']`: The locale to set, defaults to 'de_DE.UTF-8'
- `default['users']`: This is used for a lot of different things, defaults to `['chef']`
  - If you include the optional users recipe these users will be created and added to the chef group
  - These users will get the bash chef environment installed
  - These users will get the VSCode extensions installed
  - If the gnome recipe is included it is used to setup keyboard shortcuts

### users_from_data_bag

Used in the optional users_from_data_bag recipe:
- `default['codenamephp']['workstation_chef']['users_from_data_bag']['data_bag_name']`: The name of the databag to get the users from, defaults to `'users'`
- `default['codenamephp']['workstation_chef']['users_from_data_bag']['groups']`: The groups to find the users that will be managed. Defaults to `%w(chef docker sudo sysadmin)`

### users
Used in the optional users cookbook:

The recipe checks for a specific path within the attributes that corresponds to the values of `default['users']` to copy ssh keys.
There is a default set for the default 'chef' user:

- `default['codenamephp']['workstation_chef']['ssh_keys']['local_copy']['chef']['private_key_source']`: `'/var/workspace/id_rsa'`


## Recipes

These are the recipes that are not included in the default recipe and can be used to "customize" the chef run.
The default recipe sets up everything else by including the recipes not listed here. Most notably, users and gui are optional.

### Gnome
Installs the gnome desktop and sets serveral settings and keyboard shortcuts

### Creating users
There are several ways to create users. These should be included before the default recipe so the users are already set up when the other tools are installed.
If you don't use one of those recipes make sure to create the users yourself since you might run into problems when the recipes try to setup tools that are bound to a user (like vscode)

#### Users
The users recipe is very very simple user setup. It just creates all users in the `default['users']` attribute with a home directory and an empty password and add them to the chef group.

It checks for a specific path within the attributes that corresponds to the values of `default['users']` to copy ssh keys.
There is a default set for the default 'chef' user:

- `default['codenamephp']['workstation_chef']['ssh_keys']['local_copy']['chef']['private_key_source']`: `'/var/workspace/id_rsa'`

You can change this value or add additional attributes for additional users. If you need anything more sophisticated you should provide your own logic in a wrapper cookbook.

#### Users From Data Bag
A more sophisticated method of creating users. It looks for a databag with the name in `default['codenamephp']['workstation_chef']['users_from_data_bag']['data_bag_name']`
and adds all users that have one the groups from `default['codenamephp']['workstation_chef']['users_from_data_bag']['groups']`.

Note that the `default['users']` attribute is still important since this is used to setup things like vscode and chef. The databag is just for the creation of the users so you
should try to match them (for now).


[user_cookbook_url]: https://supermarket.chef.io/cookbooks/user
[vscode_url]: https://code.visualstudio.com/

