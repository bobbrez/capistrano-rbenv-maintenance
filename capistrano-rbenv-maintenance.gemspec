# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "capistrano-rbenv-maintenance"
  spec.version       = '1.2.1'
  spec.authors       = ['Bob Breznak', 'Andrew Hammond']
  spec.email         = ['bob.breznak@gmail.com', 'andrew@evertrue.com']
  spec.summary       = %q{Tasks for maintaining rbenv with Capistrano}
  spec.description   = %q{Tasks for maintaining rbenv with Capistrano}
  spec.homepage      = 'https://github.com/bobbrez/capistrano-rbenv-maintenance'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'capistrano', '~> 3.0'
end
