# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/newrelic/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-newrelic'
  spec.version       = Capistrano::NewRelic::VERSION
  spec.authors       = ['Abdelkader Boudih', 'Jay Chung']
  spec.email         = ['terminale@gmail.com', 'woosubc@gmail.com']
  spec.description   = %q{New Relic integration for Capistrano 3}
  spec.summary       = %q{New Relic integration for Capistrano}
  spec.homepage      = 'https://github.com/seuros/capistrano-newrelic'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '~> 3.1.0'
  spec.add_dependency 'newrelic_rpm'
end
