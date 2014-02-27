# Capistrano Rbenv Maintenance
A Capistrano 3 extension that allows for easily maintaining rbenv. Use the
[Capistrano Rbenv](https://github.com/capistrano/rbenv) gem for using rbenv with Capistrano, use this gem to
add additional tasks for setting up rbenv and installing rubies.

## Installation
Add this line to your application's Gemfile:

    gem 'capistrano-rbenv-maintenance'

And then execute:

    $ bundle

Then add this line to your Capfile:

    require 'capistrano/rbenv/maintenance'


## Tasks

### rbenv:setup
This task does an initial install, if necessary, of rbenv and the ruby-build plugin.

### rbenv:upgrade
This task upgrades rbenv and ruby-build

### rbenv:install
This task installs a ruby using ruby-build, if necessary. If no option is provided, the task will try to
install the ruby set via `rbenv_ruby`.

## Automatic Hooks
These tasks are automatically hooked off of the `rbenv:map_bins` and `rbenv:validate` tasks provided by
Capistrano Rbenv. This means that once you install the gem and add it to your Capfile, you're ready to go.
Every deployment will check to see if rbenv is installed and if the proper version of ruby is installed. If
not, it will install as necessary.

# Configuration
Under normal circumstances, no configuration should be necessary but it is provided to allow to workarounds if necessary.

* `ruby_build_path` - The path where ruby-build should be installed. Defaults to `plugins/ruby-build` under `rbenv_path`
* `rbenv_git_url` - The git url used to download and install rbenv. Defaults to `git://github.com/sstephenson/rbenv.git`
* `ruby_build_git_url` - The git url used to download and install ruby-build. Defaults to `git://github.com/sstephenson/ruby-build.git`

## Contributing
1. Fork it ( http://github.com/<my-github-username>/capistrano-rbenv-maintenance/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits
This is originally based off of a [pull request](https://github.com/stas/rbenv/commit/9cd333db1655af3d2dbb345a6cf61aff1755462c)
from [Stas Sușcov](https://github.com/stas). Gemified and maintained by [Bob Breznak](https://github.com/bobbrez)
