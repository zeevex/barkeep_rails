# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'barkeep_rails/version'

Gem::Specification.new do |gem|
  gem.name          = "barkeep_rails"
  gem.version       = BarkeepRails::VERSION
  gem.authors       = ["Robert Sanders"]
  gem.email         = ["robert@zeevex.com"]
  gem.description   = %q{Simple Rails helper to embed dynamically generated barcodes as images.
                         Currently Depends on the barcodes4me.com service.}
  gem.summary       = %q{Simple Rails helper to embed dynamically generated barcodes as images.}
  gem.homepage      = "http://github.com/zeevex/barkeep_rails"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec', '~> 2.9.0'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'activesupport'

end
