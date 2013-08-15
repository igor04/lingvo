# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lingvo/version'

Gem::Specification.new do |spec|
  spec.name          = "lingvo"
  spec.version       = Lingvo::VERSION
  spec.authors       = ["Igor G"]
  spec.email         = ["igor.s04@mail.ru"]
  spec.description   = %q{test gem}
  spec.summary       = %q{test gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "qtbindings"

  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "activerecord-jdbcsqlite3-adapter"
  spec.add_development_dependency "nokogiri"
end
