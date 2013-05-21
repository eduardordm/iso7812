# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iso7812/version'

Gem::Specification.new do |gem|

  gem.add_development_dependency "rspec"

  gem.name          = "iso7812"
  gem.version       = Iso7812::VERSION
  gem.authors       = ["Eduardo Mourao"]
  gem.email         = ["eduardo.a20@gmail.com"]
  gem.description   = %q{Full implementation of the ISO-7812 standard}
  gem.summary       = %q{Full implementation of the ISO-7812 standard}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
