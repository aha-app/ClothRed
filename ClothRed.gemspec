# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ClothRed/version', __FILE__)

Gem::Specification.new do |gem|
    gem.authors       = ["Rally Software Development Corp"]
    gem.email         = ["connectors@rallydev.com"]
    gem.description   = %q{}
    gem.summary       = %q{}
    gem.homepage      = "http://www.rallydev.com/"

    gem.files         = `git ls-files`.split($\)
    gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
    gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
    gem.name          = "ClothRed"
    gem.require_paths = ["lib"]
    gem.version       = ClothRed::VERSION
    ##TODO Make these gems listed below as dev dependencies.
    gem.add_development_dependency 'rspec'
    gem.add_development_dependency 'rake'
    gem.add_development_dependency 'ci_reporter'
    gem.add_development_dependency 'simplecov'
    gem.add_development_dependency 'test-unit'
    gem.add_development_dependency 'geminabox', '~> 0.10'
end
