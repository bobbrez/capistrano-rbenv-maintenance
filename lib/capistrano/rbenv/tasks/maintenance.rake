namespace :rbenv do
  desc 'Install rbenv and ruby-build, if necessary'
  task :setup do
    on roles(fetch(:rbenv_roles)) do
      [:rbenv, :ruby_build].each do |component|
        path = fetch("#{component}_path".to_sym)
        url = fetch("#{component}_git_url".to_sym)
        execute :git, 'clone', url, path unless test "[ -d #{path} ]"
      end
    end
  end

  desc 'Upgrade rbenv and ruby-build'
  task :update do
    on roles(fetch(:rbenv_roles)) do
      [fetch(:rbenv_path), fetch(:ruby_build_path)].each do |update_path|
        within update_path do
          execute :git, 'pull'
        end
      end
    end
  end

  desc 'Install a new ruby or, the one provided by rbenv_ruby if none is given.'
  task :install, [:new_ruby] do |task, args|
    on roles(fetch(:rbenv_roles)) do
      ruby_version =  args[:new_ruby] || fetch(:rbenv_ruby)

      unless test "[ -d #{fetch(:rbenv_path)}/versions/#{ruby_version} ]"
        execute :rbenv, 'install', args[:new_ruby] || fetch(:rbenv_ruby)
        execute :rbenv, 'local', args[:new_ruby] || fetch(:rbenv_ruby)
        execute :rbenv, 'rehash'
        execute :gem, 'install', 'bundler' unless fetch(:bundle_roles)
        execute :rbenv, 'rehash'
      end
    end
  end

  before 'rbenv:validate', 'rbenv:setup'
  before 'rbenv:install', 'rbenv:map_bins'
  before 'rbenv:validate', 'rbenv:install'
end

namespace :load do
  task :defaults do
    set :ruby_build_path, -> { '%s/plugins/ruby-build' % fetch(:rbenv_path) }
    set :rbenv_git_url, 'git://github.com/sstephenson/rbenv.git'
    set :ruby_build_git_url, 'git://github.com/sstephenson/ruby-build.git'
  end
end
