# -*- encoding: utf-8 -*-
require File.expand_path('../lib/smartcsv/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Arthur Harder"]
  gem.email         = ["info@easywebsolutions.de"]
  gem.description   = %q{}
  gem.summary       = %q{A CSV wrapper for read method with autodetect of column separator and encoding to utf-8}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "smartcsv"
  gem.require_paths = ["lib"]
  gem.version       = Smartcsv::VERSION

  gem.add_development_dependency 'rspec', '~> 2.10.0'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'rb-fsevent'
  gem.add_dependency 'cmess'
end
