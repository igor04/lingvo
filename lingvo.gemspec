# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lingvo/version'

Gem::Specification.new do |spec|
  spec.name          = "lingvo"
  spec.version       = Lingvo::VERSION
  spec.authors       = ["Igor G"]
  spec.email         = ["igor.s04@mail.ru"]
  spec.description   = %q{Will help don't forget english words}
  spec.summary       = %q{Lingvo - easy helper in learning english words}
  spec.homepage      = 'https://github.com/igor04/lingvo'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10"
  spec.add_development_dependency "rspec", "~> 2.0"
  spec.add_development_dependency "qtbindings", "~> 4.8"

  spec.add_development_dependency "activerecord", "~> 3.0"
  spec.add_development_dependency "sqlite3", "~> 1.3"
  spec.add_development_dependency "activerecord-jdbcsqlite3-adapter", "~> 1.2"
  spec.add_development_dependency "nokogiri", "~> 1.6"
end
