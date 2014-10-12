# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clazz_extensions/version'

Gem::Specification.new do |spec|
  spec.name          = "clazz_extensions"
  spec.version       = ClazzExtensions::VERSION
  spec.authors       = ["hiraokashogi"]
  spec.email         = ["panda1200813@yahoo.co.jp"]
  spec.summary       = "Add utility methods on defined class."
  spec.description   = "Add utility methods on defined class."
  spec.homepage      = "https://github.com/hiraoka/clazz_extensions"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
end
